import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/watcher/friend_request_cubit.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';
import 'package:smart_dish/presentation/friends/friends_page.dart';
import 'package:smart_dish/presentation/friends/widgets/buttons.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';
import 'package:smart_dish/utils/date_time_extensions.dart';

class RequestItem extends StatelessWidget {
  const RequestItem(
    this.initRequest, {
    Key? key,
  }) : super(key: key);

  final FriendRequest initRequest;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendRequestCubit, WatcherState<List<FriendRequest>>>(
      buildWhen: (p, c) {
        if (c is LoadingSuccessful<List<FriendRequest>> &&
            p is LoadingSuccessful<List<FriendRequest>>) {
          final before = p.data.findRequestOrNull(initRequest.id!);
          final after = c.data.findRequestOrNull(initRequest.id!);
          if (after == null) return false;
          if (before != after) return true;
        }
        return p.runtimeType != c.runtimeType;
      },
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => const SizedBox(),
          loadingSuccessful: (state) {
            final request = state.data.findRequestOrNull(initRequest.id!) ??
                initRequest.copyWith(id: ""); // for remove animation

            return ListTile(
              onTap: () {},
              leading: OvalImage(
                request.isReceivedBySignedInUser
                    ? request.senderImageUrl
                    : request.receiverImageUrl,
              ),
              title: request.isReceivedBySignedInUser
                  ? Text(request.senderName, overflow: TextOverflow.ellipsis)
                  : Text(request.receiverName, overflow: TextOverflow.ellipsis),
              subtitle: Builder(
                builder: (context) {
                  if (request.id!.isEmpty) return const Text("");
                  if (request.actionFailure != null) {
                    return Text(
                      request.actionFailure!.toMessage(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  if (request.isBeingConfirmed || request.isBeingRejected) {
                    return const Text("is loading...");
                  }
                  if (request.accepted == true) {
                    return const Text(
                      "Request confirmed.",
                      style: TextStyle(color: Colors.green),
                    );
                  }
                  if (request.accepted == false &&
                      request.isReceivedBySignedInUser) {
                    return const Text(
                      "Request rejected.",
                      style: TextStyle(color: Colors.green),
                    );
                  }
                  if (request.accepted == false &&
                      !request.isReceivedBySignedInUser) {
                    return const Text(
                      "Request withdrawn.",
                      style: TextStyle(color: Colors.green),
                    );
                  }
                  if (request.accepted == null &&
                      request.isReceivedBySignedInUser) {
                    return Text(
                      "received ${request.createdAt?.toDisplayedString()}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    );
                  }
                  if (request.accepted == null &&
                      !request.isReceivedBySignedInUser) {
                    return Text(
                      "sent ${request.createdAt?.toDisplayedString()}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    );
                  } else {
                    return const Text("");
                  }
                },
              ),
              trailing: Builder(
                builder: (context) {
                  if (request.accepted != null || request.id!.isEmpty) {
                    return const Icon(Icons.check_circle, color: Colors.green);
                  }
                  if (request.isReceivedBySignedInUser) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AcceptFriendRequestButton(request, key: UniqueKey()),
                        const SizedBox(width: 4),
                        RejectFriendRequestButton(request, key: UniqueKey()),
                      ],
                    );
                  } else {
                    return WithdrawFriendRequestButton(request);
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}

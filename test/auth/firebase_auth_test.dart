import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart'
    as firebase_auth_mocks;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/auth/i_auth_repo.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockAdditionalUserInfo extends Mock implements AdditionalUserInfo {}

void main() {
  const validEmail = "1@1.de";
  const validPassword = "123123";

  late FirebaseAuthRepo firebaseAuthRepo;
  late MockFirebaseAuth mockFireBaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockAdditionalUserInfo mockAdditionalUserInfo;
  const fakeUserId = "1";

  setUp(() {
    mockFireBaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockAdditionalUserInfo = MockAdditionalUserInfo();
    firebaseAuthRepo = FirebaseAuthRepo(mockFireBaseAuth);

    when(() => mockUserCredential.user).thenReturn(mockUser);
    when(() => mockUserCredential.additionalUserInfo)
        .thenReturn(mockAdditionalUserInfo);
    when(() => mockUser.uid).thenReturn(fakeUserId);
    when(() => mockUser.email).thenReturn("");
  });

  void setUpFireBaseAuthCreateUserWithEmailAndPasswordSuccessful() {
    when(() => mockFireBaseAuth.createUserWithEmailAndPassword(
        email: validEmail,
        password: validPassword)).thenAnswer((_) async => mockUserCredential);
  }

  void setUpFireBaseAuthCreateUserWithEmailAndPasswordUnsuccessful() {
    when(() => mockFireBaseAuth.createUserWithEmailAndPassword(
        email: validEmail,
        password: validPassword)).thenAnswer(
      (_) async => throw FirebaseAuthException(code: 'any'),
    );
  }

  void setUpFireBaseAuthSignInWithEmailAndPasswordSuccessful() {
    when(() => mockFireBaseAuth.signInWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        )).thenAnswer((_) async => mockUserCredential);
  }

  void setUpFireBaseAuthSignInWithEmailAndPasswordUnsuccessful() {
    when(() => mockFireBaseAuth.signInWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ))
        .thenAnswer((_) async =>
            throw FirebaseAuthException(message: 'any', code: 'any'));
  }

  group('signOut()', () {
    test(
      'should call firebaseAuth.signOut',
      () async {
        // arrange
        when(() => mockFireBaseAuth.signOut()).thenAnswer((_) async {});
        // act
        firebaseAuthRepo.signOut();
        // assert
        verify(() => mockFireBaseAuth.signOut());
      },
    );
  });
  group('registerWithEmailAndPassword()', () {
    test(
      'should call firebaseAuthFacade.createUserWithEmailAndPassword()',
      () async {
        // arrange
        setUpFireBaseAuthCreateUserWithEmailAndPasswordSuccessful();
        // act
        firebaseAuthRepo.registerWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        );
        // assert
        verify(() => mockFireBaseAuth.createUserWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ));
      },
    );

    test(
      'should return Right(unit) when registering with valid email and password was successful',
      () async {
        // arrange
        setUpFireBaseAuthCreateUserWithEmailAndPasswordSuccessful();
        // act
        final result = await firebaseAuthRepo.registerWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        );
        // assert
        verify(() => mockFireBaseAuth.createUserWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ));
        expect(result, equals(const Right(unit)));
      },
    );

    test(
      'should return Left(AuthFailure) when registering with valid email and password was unsuccessful',
      () async {
        // arrange
        setUpFireBaseAuthCreateUserWithEmailAndPasswordUnsuccessful();
        // act
        final result = await firebaseAuthRepo.registerWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        );
        // assert
        verify(() => mockFireBaseAuth.createUserWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ));
        expect(result, equals(const Left(AuthFailure.serverError())));
      },
    );
  });
  group('signInWithEmailAndPassword()', () {
    test(
      'should call firebaseAuthFacade.signInWithEmailAndPassword()',
      () {
        // arrange
        setUpFireBaseAuthSignInWithEmailAndPasswordSuccessful();
        // act
        firebaseAuthRepo.signInWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        );
        // assert
        verify(() => mockFireBaseAuth.signInWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ));
      },
    );

    test(
      'should return Right(unit) when signing in with valid email and password was successful',
      () async {
        // arrange
        setUpFireBaseAuthSignInWithEmailAndPasswordSuccessful();
        // act
        final result = await firebaseAuthRepo.signInWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        );
        // assert
        verify(() => mockFireBaseAuth.signInWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ));
        expect(result, equals(const Right(unit)));
      },
    );

    test(
      'should return Left(AuthFailure) when signing in with valid email and password was unsuccessful',
      () async {
        // arrange
        setUpFireBaseAuthSignInWithEmailAndPasswordUnsuccessful();
        // act
        final result = await firebaseAuthRepo.signInWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        );
        // assert
        verify(() => mockFireBaseAuth.signInWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ));
        expect(result, equals(const Left(AuthFailure.serverError())));
      },
    );
  });
  group('watchUserState()', () {});
}

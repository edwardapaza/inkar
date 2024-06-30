// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:proyecto_inkar/src/data/dataSource/local/SharefPref.dart'
    as _i3;
import 'package:proyecto_inkar/src/data/dataSource/remote/services/AuthService.dart'
    as _i4;
import 'package:proyecto_inkar/src/di/AppModule.dart' as _i7;
import 'package:proyecto_inkar/src/domain/repository/AuthRepository.dart'
    as _i5;
import 'package:proyecto_inkar/src/domain/useCases/auth/AuthUseCases.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.SharefPref>(() => appModule.sharefPref);
    gh.factory<_i4.AuthService>(() => appModule.authService);
    gh.factory<_i5.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i6.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}

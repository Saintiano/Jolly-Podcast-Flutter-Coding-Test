import 'package:get/get.dart';
import 'package:jolly_podcast_test/data.dart';
import 'package:jolly_podcast_test/models/auth/auth_model.dart';
import 'package:jolly_podcast_test/models/general_type_def.dart';
import 'package:jolly_podcast_test/models/podcast/podcasts_model.dart';
import 'package:jolly_podcast_test/models/podcast/trending_podcast_model.dart';
import 'package:jolly_podcast_test/repositories/auth/auth_repository.dart';
import 'package:jolly_podcast_test/utils/app_helpers.dart';

class AuthController extends GetxController {
  final _authHttpsRepository = AuthHttpsRepository();
  AuthController(_authHttpsRepository);

  // @override
  // void onInit() {
  //   getAllPodcastsController(
  //       page: 1,
  //       per_page: 4,
  //       loading: (loading){
  //         print("loading $loading");
  //       });
  //   super.onInit();
  // }

  Future<DataVmActionResponse> loginController(
      {
        required String phoneNumber,
        required String password,
        required Function(bool) loading
      }) async {

    loading(true);

    try {

      final res = await _authHttpsRepository.login(
        phoneNumber: phoneNumber,
        password: password,
      );

      if (res.code == AppHelpers.successCode) {
        InternalStorageDB.addUserDetails(AuthModel_Data.fromJson(res.data));
        InternalStorageDB.authKey(InternalStorageDB.getUserDetails()!.token);
        return (data: res.data, success: true, error: null);
      } else {
        return (data: null, success: false, error: res.message);
      }
    } catch (e) {
      return (data: null, success: false, error: e.toString());
    } finally {
      print("Finally login Controller");
      loading(false);
    }

  }

  Future<PodcastsModel> getAllPodcastsController(
      {
        required int page,
        required int per_page,
        required Function(bool) loading
      }) async {

    loading(true);

    try {
      final res = await _authHttpsRepository.getAllPodcasts(page: page, per_page: per_page);
      // print("getTransactionCategoriesController ${res.data}");

      if (res.code == AppHelpers.successCode) {
        PodcastsModel data = PodcastsModel.fromJson({
          "message": res.message,
          "data": res.data,
        });
        return data;
      } else {
        PodcastsModel data = PodcastsModel.fromJson({
          "message": res.message,
          "data": null,
        });

        return data;
      }
    } catch (e) {
      PodcastsModel data = PodcastsModel.fromJson({
        "message": e.toString(),
        "data": null,
      });
      return data;
    } finally {
      // print("Finally Get Transaction Categories");
      loading(false);
    }

  }

  Future<TrendingPodcastModel> trendingPodcastController(
      {
        required int page,
        required int per_page,
        required Function(bool) loading
      }) async {

    loading(true);

    try {
      final res = await _authHttpsRepository.trendingPodcast(page: page, per_page: per_page);
      // print("getTransactionCategoriesController ${res.data}");

      if (res.code == AppHelpers.successCode) {
        TrendingPodcastModel data = TrendingPodcastModel.fromJson({
          "message": res.message,
          "data": res.data,
        });
        return data;
      } else {
        TrendingPodcastModel data = TrendingPodcastModel.fromJson({
          "message": res.message,
          "data": null,
        });

        return data;
      }
    } catch (e) {
      TrendingPodcastModel data = TrendingPodcastModel.fromJson({
        "message": e.toString(),
        "data": null,
      });
      return data;
    } finally {
      // print("Finally Get Transaction Categories");
      loading(false);
    }

  }

}
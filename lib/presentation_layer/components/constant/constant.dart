import 'package:club_cast/presentation_layer/models/login_model.dart';

/////// end Points ////////////
var token;

UserLoginModel? ahmedModel;
const String baseUrl = "https://audiocomms-podcast-platform.herokuapp.com/api/";
const String login = "v1/users/login";
const String signup = "v1/users/signup";
const String forgotPassword = "v1/users/forgotPassword";
const String AllCategory = "/v1/categories/";
const String profile = "v1/users/me";
const String updateProfile = "v1/users/updateMe";
const String update_Password = "v1/users/updateMyPassword";
const String GetAllPodcasts = baseUrl + 'v1/podcasts';
const String sendLike = baseUrl + 'v1/podcasts/likes/';
const String getPodcastLikesUsers = baseUrl + 'v1/podcasts/likes/';
const String userById = 'v1/users/';
const String getuserPodCast = baseUrl + 'v1/podcasts?createdBy=';
const String searchUser = 'v1/users/search?s=';
const String removePodCastById = baseUrl + 'v1/podcasts/';
const String getMyPodCasts = baseUrl + 'v1/podcasts/me';
const String getMyFollowingPodcasts = baseUrl + 'v1/podcasts/following/me';
const String myFollowers = 'v1/users/me/followers';
const String myFollowing = 'v1/users/me/following';

const String generateSignature = baseUrl + 'v1/podcasts/generateSignature';
const String createPodCast = baseUrl + 'v1/podcasts';
const String getAllPodCastWithoutMe = baseUrl + 'v1/podcasts/notMe';

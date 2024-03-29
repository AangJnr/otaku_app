import 'package:multiple_result/multiple_result.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/data/model/profile_response/profile_response.dart';
import 'package:otaku_katarougu_app/data/model/user/a_user_response/a_user_response.dart';
import 'package:otaku_katarougu_app/domain/model/category/category.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';
import 'package:otaku_katarougu_app/domain/model/subscription.dart';
import 'package:otaku_katarougu_app/domain/model/upload_photo_request.dart';
import 'package:otaku_katarougu_app/domain/repository/user_repository.dart';

import '../../../domain/model/user.dart';
import '../../model/category_response/category_response.dart';
import '../../model/subscription_response.dart';
import 'base_repository.dart';

class UserRepositoryImpl with BaseRepository implements UserRepository {
  static Profile? profileCache;
  @override
  Future<Result<Subscription, Exception>> createAccount(
      SubscriptionRequest subscriptionRequest) async {
    var data =
        await processRequest(() => apiService.createUser(subscriptionRequest));
    if (data.isSuccess()) {
      //Save token
      sessionManager.setAccessToken(
          (data.tryGetSuccess()! as Map<String, dynamic>)['token']);
      return await subscribe(subscriptionRequest);
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<Subscription, Exception>> getActiveSubscription() async {
    var data = await processRequest(() => apiService.activeSubscription());
    if (data.isSuccess()) {
      return Success(
          SubscriptionResponse.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<List<Category>, Exception>> getCategories() async {
    var data = await processRequest(() => apiService.getCategories());
    try {
      if (data.isSuccess()) {
        List<dynamic> dataList = data.tryGetSuccess()!;
        return Success(dataList
            .map((e) => CategoryResponse.fromMap(e).mapToDomain())
            .toList());
      }
    } catch (e) {
      getLogger('UserRepo').e(e.toString());
    }
    return Future.value(Error(data.tryGetError() ?? Exception()));
  }

  @override
  Future<Result<Profile?, Exception>> getPublicProfile(String uid) async {
    if (uid.isEmpty) {
      return Error(Exception("Ha! is empty"));
    }
    if (profileCache != null) {
      return Success(profileCache!);
    }

    var data = await processRequest(() => apiService.getPublicProfile(uid));
    if (data.isSuccess()) {
      profileCache =
          ProfileResponse.fromMap(data.tryGetSuccess()!).mapToDomain();
      return Success(profileCache);
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<User, Exception>> getUser() async {
    var data = await processRequest(() => apiService.getUser());
    if (data.isSuccess()) {
      final responseData = data.tryGetSuccess()!;
      final user = AUserResponse.fromMap(responseData).mapToDomain();
      sessionManager.setUser(user);
      return Success(user);
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<List<Profile>, Exception>> getProfiles() async {
    var data = await processRequest(() => apiService.getMyProfiles());
    if (data.isSuccess()) {
      final responseData = data.tryGetSuccess()! as List<dynamic>;
      return Success(responseData
          .map((e) => ProfileResponse.fromMap(e).mapToDomain())
          .toList());
    }
    return const Success([]);
  }

  @override
  Future<Result<Subscription, Exception>> subscribe(
      SubscriptionRequest subscriptionRequest) async {
    var data =
        await processRequest(() => apiService.subscribe(subscriptionRequest));
    if (data.isSuccess()) {
      final payload = data.tryGetSuccess()!;
      getUser();
      return Success(
          SubscriptionResponse.fromMap(payload['subscription']).mapToDomain());
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<Profile, Exception>> updateProfile(
      String uid, Profile profile) async {
    var data = await processRequest(() => apiService.editProfile(uid, profile));
    if (data.isSuccess()) {
      getUser();
      return Success(
          ProfileResponse.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<bool, Exception>> updateProfilePhoto(
      UploadPhotoRequest uploadPhotoRequest) async {
    var data =
        await processRequest(() => apiService.uploadPhoto(uploadPhotoRequest));
    if (data.isSuccess()) {
      getUser();
      return const Success(true);
    }
    return Future.value(Error(data.tryGetError()!));
  }
}

final List<Map<String, dynamic>> testData = [
  {
    "uid": "CfIeV5vy3T1RAP5oou9T",
    "name": "Basic",
    "features": [
      "NFC enabled Card",
      "Engraved QR code",
      "Manage up to 3 profiles",
      "Profile sharing via QR, NFC and link",
      "Custom links",
      "Themes"
    ],
    "amount": 100.0,
    "currency": "GHS",
    "cardType": {"colorName": "Silver", "nfcEnabled": true},
    "durationInDays": 365,
    "noOfProfilesAllowed": 3
  }
];

//   profileCache = ProfileResponse.fromMap({
//     'firstName': 'Emily',
//     'lastName': 'Reynolds',
//     'bio': 'Emily Reynolds is a visionary Creative Designer at Twitter, known for her innovative approach to visual storytelling in the digital age. With a passion for blending art and technology, Emily has redefined the way users engage with content on the Twitter platform.'
//         'Emily\'s journey into the world of design began at an early age, fueled by her love for aesthetics and her curiosity for new media. She honed her skills through formal education in graphic design and interactive media, but her true breakthrough came when she joined Twitter in 2015.'
//         'Over the years, Emily has played a pivotal role in shaping Twitter\'s visual identity. Her work has been instrumental in crafting impactful ad campaigns, creating eye-catching visuals, and enhancing user experiences. She\'s known for her ability to translate complex ideas into simple, engaging designs that resonate with a diverse global audience.'
//         'Emily\'s dedication to her craft extends beyond her work at Twitter. She is a tireless advocate for diversity and inclusion in the design industry, actively participating in mentorship programs and pushing for equal opportunities for underrepresented groups. Her creative prowess and commitment to inclusivity make her a true trailblazer in the ever-evolving field of design.'
//         'Whether she\'s collaborating with cross-functional teams, experimenting with cutting-edge design tools, or pushing the boundaries of digital art, Emily Reynolds continues to inspire and shape the future of design at Twitter and beyond. Her work reminds us that in the fast-paced world of social media, creativity knows no bounds.',
//     'email': 'ereynolds@twitter.com',
//     'phone': '+10934322434212',
//     'web': 'www.ereynolds.com',
//     'headerImage': '',
//     'picture':
//         "https://images.pexels.com/photos/5615665/pexels-photo-5615665.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     'pageVisitCount': 345,
//     'userUid': 'userUid',
//     'key': '',
//     'socials': {
//       'whatsapp': '+233263202632',
//       'instagram': 'aangjnr',
//       'linkedIn': 'camara-laye-ibrahim-karim-4a7b01103',
//       'twitter': 'aang.jnr',
//       'facebook': 'cionaang'
//     },
//     'relevantWorks': [
//       {
//         'title': 'Google',
//         'role': 'ML Engineer',
//         'description':
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum turpis quis eros ultricies lacinia. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam ac sagittis enim. Phasellus vitae elit in est luctus interdum facilisis eu leo. Sed sit amet nisl luctus, accumsan arcu sit amet, congue eros. Sed a purus elit. Mauris imperdiet tortor ultricies nulla blandit scelerisque. Mauris a augue mattis, lobortis urna convallis, mollis turpis. Vivamus ligula erat, consectetur at ullamcorper vitae, tristique vitae odio. Suspendisse a mollis magna. Cras tristique odio nec nulla maximus suscipit. Vivamus dolor ante, ultricies eget arcu id, fermentum tincidunt odio. Suspendisse quis dui consequat, iaculis elit vel, vestibulum magna. In hac habitasse platea dictumst. Morbi et velit nunc. Donec imperdiet ipsum in dolor malesuada vehicula. Cras vitae porttitor ante. Curabitur eros velit, mollis non sodales vitae, euismod at ante. Pellentesque mattis mi eu vestibulum rhoncus. Quisque eu lacus sit amet felis feugiat aliquam ut a neque. Morbi varius arcu quis scelerisque fringilla. Mauris efficitur justo in lacus malesuada, eget convallis augue suscipit.',
//         'startDate': '2022/03/22',
//         'endDate': null,
//         'isCurrentRole': false
//       },
//       {
//         'title': 'Instagram',
//         'role': 'ML Engineer',
//         'description':
//             'Suspendisse eu diam tellus. Praesent vulputate ipsum eget nunc vestibulum, non vehicula felis ornare. Curabitur non bibendum elit. Proin lorem tellus, vehicula ac malesuada a, ultrices quis enim. Integer porttitor pulvinar dignissim. Morbi suscipit augue eu sem tempus blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ac gravida tellus, eget efficitur turpis. Aenean non tortor in magna luctus faucibus non in nisl. Phasellus pellentesque tincidunt velit ac varius. Etiam non venenatis turpis, id ullamcorper sapien. Donec nisi augue, euismod et interdum sit amet, malesuada ac massa',
//         'startDate': '2022/03/22',
//         'endDate': null,
//         'isCurrentRole': false
//       },
//       {
//         'title': 'Yahoo!',
//         'role': 'ML Engineer',
//         'description':
//             'Cras eu fringilla mauris, sodales facilisis neque. Morbi tincidunt, nunc quis cursus mollis, tortor massa efficitur ex, vel auctor est nulla non lacus. Nam mollis eu lectus at hendrerit. Nullam eu ante venenatis, euismod neque quis, porttitor sem. Nullam interdum ipsum at suscipit ornare. Suspendisse interdum, diam at vehicula efficitur, sapien sem laoreet lorem, at lacinia felis lectus a leo. Quisque neque odio, euismod tincidunt lectus eget, vestibulum bibendum eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed sagittis dui, nec fringilla est. Praesent aliquet libero nec nisi fermentum, eu dapibus velit sagittis. Sed eget odio non lorem vehicula commodo.',
//         'startDate': '2022/03/22',
//         'endDate': null,
//         'isCurrentRole': false
//       }
//     ],
//     'category': testData[0]
//   }).mapToDomain();
// }

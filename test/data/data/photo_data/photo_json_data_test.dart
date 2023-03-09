import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:image_search_app_prac/data/data/photo_data/photo_json_data.dart';
import 'package:image_search_app_prac/domain/model/photo/photo.dart';
import 'package:image_search_app_prac/util/result.dart';

void main() {
  test('photo json data 를 가져온다', () async {
    final jsonData = PhotoJsonData(mockClient);

    final Result<List<Photo>> result = await jsonData.fetchApi('apple');
    expect((result as Success<List<Photo>>).data.first.id, 634572);
  });
}

const query = 'apple';
const baseUrl = 'https://pixabay.com/api/';
const myKey = '32914845-e8ba3b79c1df4a533f0111dae';

final url = Uri.parse('$baseUrl?key=$myKey&q=$query&image_type=photo');
final mockClient = MockClient((request) async {
  if (request.url == url) {
    return Response(fakeJson, 200);
  }

  return Response('error', 400);
});

const fakeJson = '''{
  "total": 9148,
  "totalHits": 500,
  "hits": [
    {
      "id": 634572,
      "pageURL": "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
      "type": "photo",
      "tags": "apples, fruits, red",
      "previewURL": "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
      "previewWidth": 100,
      "previewHeight": 150,
      "webformatURL": "https://pixabay.com/get/g0403e49686ef97b5577eb457d9917ac62f80ec0c0d1b67bb2418e6bc5bf41723c26266f82bde52a95cf72de9be875677_640.jpg",
      "webformatWidth": 427,
      "webformatHeight": 640,
      "largeImageURL": "https://pixabay.com/get/g725cd939a37ccd06fe53387feeced082da369c4c456e58b4d4aa1f16927381fce0dd0472f9a6faebe1b3726180bc1821bbaa419db8b424e052bd2f47dbfa556c_1280.jpg",
      "imageWidth": 3345,
      "imageHeight": 5017,
      "imageSize": 811238,
      "views": 474537,
      "downloads": 277318,
      "collections": 1268,
      "likes": 2352,
      "comments": 194,
      "user_id": 752536,
      "user": "Desertrose7",
      "userImageURL": "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
    },
    {
      "id": 1868496,
      "pageURL": "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
      "type": "photo",
      "tags": "apple, computer, desk",
      "previewURL": "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g926dae523ed46702c4cb66399ae9b15cad856539f4757b6eb570bb9ea877c764096ff37b4f938fce761ab9d9a41975776bd13219db7ced4929381d718c26913a_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g830b6295e4ec0f1480800ee678ca6f7f81982f8abbb4e614526bf4ebdf5110d2fc9684aaf78fb60a40f16dcffe9b20d48d58ff5e62ac989d958fa71fe7808b10_1280.jpg",
      "imageWidth": 5184,
      "imageHeight": 3456,
      "imageSize": 2735519,
      "views": 678340,
      "downloads": 492945,
      "collections": 1374,
      "likes": 1028,
      "comments": 274,
      "user_id": 2286921,
      "user": "Pexels",
      "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
    },
    {
      "id": 1873078,
      "pageURL": "https://pixabay.com/photos/apples-orchard-apple-trees-1873078/",
      "type": "photo",
      "tags": "apples, orchard, apple trees",
      "previewURL": "https://cdn.pixabay.com/photo/2016/11/30/15/23/apples-1873078_150.jpg",
      "previewWidth": 150,
      "previewHeight": 95,
      "webformatURL": "https://pixabay.com/get/gdf14b99105028a1a5ef560082074e264397056e705c1ff84ed9fcd3a17d9c46ca96a3f1aae38e5658e4fb8ef615b3c907034f95c3c3ec0b0cdd712f9f00dbe64_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 408,
      "largeImageURL": "https://pixabay.com/get/g008b4f2e53b52858c9edc42490abc81086b6eef2ffd2f7e42ec2b96fc06bc4758589ab7fb9f16d85fdd1bd6a722ba628a02eea655ad2d66488f6d93f12dce123_1280.jpg",
      "imageWidth": 3212,
      "imageHeight": 2051,
      "imageSize": 2581012,
      "views": 433592,
      "downloads": 251288,
      "collections": 1127,
      "likes": 1136,
      "comments": 175,
      "user_id": 3890388,
      "user": "lumix2004",
      "userImageURL": ""
    },
    {
      "id": 1122537,
      "pageURL": "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
      "type": "photo",
      "tags": "apple, water droplets, fruit",
      "previewURL": "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
      "previewWidth": 150,
      "previewHeight": 95,
      "webformatURL": "https://pixabay.com/get/g03f5f95a614d4b4d65b9de1ad8946c644efd8119d4ce21e7946d6cc5386c81c331fc4e9a04705f3d324b948d7244dee8b9ed59ed87e903361d3a441be7ea79bf_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 409,
      "largeImageURL": "https://pixabay.com/get/g5152f2323efabdc9a8b6927e2a34f838a48bf00c6ea23a4ec42c50a0eb7ad7b490b7cb6d8cfe34ea359c5e1b47acc6ed55939933675fec6b9b85227bc7525d6b_1280.jpg",
      "imageWidth": 4752,
      "imageHeight": 3044,
      "imageSize": 5213632,
      "views": 322414,
      "downloads": 186035,
      "collections": 1028,
      "likes": 1143,
      "comments": 187,
      "user_id": 1445608,
      "user": "mploscar",
      "userImageURL": "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
    },
    {
      "id": 256261,
      "pageURL": "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
      "type": "photo",
      "tags": "apple, books, still life",
      "previewURL": "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g5dd6852c34b248611c42e487697ef8f4072a8dbc5dca1a49c7cf97e6384997e359994397b8911ee4922d8e37a010b986_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 423,
      "largeImageURL": "https://pixabay.com/get/g18f19da8578235495f2149544f61042116b5b1d20e18362b470590c904b430309948cefb6af1e6545c07969ee93b0a491010887eec0068e01ec051f930323c12_1280.jpg",
      "imageWidth": 4928,
      "imageHeight": 3264,
      "imageSize": 2987083,
      "views": 505812,
      "downloads": 260095,
      "collections": 937,
      "likes": 963,
      "comments": 245,
      "user_id": 143740,
      "user": "jarmoluk",
      "userImageURL": "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
    },
    {
      "id": 410324,
      "pageURL": "https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/",
      "type": "photo",
      "tags": "iphone, smartphone, apps",
      "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gbc72d24d5b367a69e9b40ea2f416bb9f451499b0e020d93329723b8debde9557d8dcef585fb39114d0052218c309f565_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/gca6a61603940e10bed162857a90e74ce2c0d9179f263fa04a2d993341328e7f867f5babd08a16bd4170946941c906b77e63e35f72cf94bb5f6ae22838c3a13f3_1280.jpg",
      "imageWidth": 2180,
      "imageHeight": 1453,
      "imageSize": 477025,
      "views": 778383,
      "downloads": 457975,
      "collections": 904,
      "likes": 815,
      "comments": 222,
      "user_id": 264599,
      "user": "JESHOOTS-com",
      "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
    },
    {
      "id": 1894723,
      "pageURL": "https://pixabay.com/photos/smartphone-cellphone-touchscreen-1894723/",
      "type": "photo",
      "tags": "smartphone, cellphone, touchscreen",
      "previewURL": "https://cdn.pixabay.com/photo/2016/12/09/11/33/smartphone-1894723_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g055fafc9c911cf059ee936e10936c1d85b2240d0f6692f22c4dd1a3a8145f976bfd7381f9402d474f89ce4ac36363bc70d98860050ee4246f5286c49d93ca86a_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g4c52f6b552f99f006dbd3060ab81804ab06fd5521e43d9bd12535944e2f94e5177c9dffe514bbcf51f8db4e512cf2f2ed1a195ee0b85ca0a62cb2ef28e201782_1280.jpg",
      "imageWidth": 5005,
      "imageHeight": 3337,
      "imageSize": 1214266,
      "views": 489379,
      "downloads": 314925,
      "collections": 774,
      "likes": 825,
      "comments": 286,
      "user_id": 282134,
      "user": "stevepb",
      "userImageURL": "https://cdn.pixabay.com/user/2015/09/15/20-33-27-452_250x250.jpg"
    },
    {
      "id": 1368187,
      "pageURL": "https://pixabay.com/photos/apple-blossom-flowers-tree-1368187/",
      "type": "photo",
      "tags": "apple blossom, flowers, tree",
      "previewURL": "https://cdn.pixabay.com/photo/2016/05/02/22/16/apple-blossom-1368187_150.jpg",
      "previewWidth": 150,
      "previewHeight": 88,
      "webformatURL": "https://pixabay.com/get/gd1555d6f2f5858cfdbfa221f1a23677e0f70ed3329ef8b313a9d6688685a2a41d05c005d4882002ad38fdd1e9a4f355aabc00b3c9f83da20862e7badc84d0e01_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 379,
      "largeImageURL": "https://pixabay.com/get/g8b63d541456c7f3fb27ee6948d3d87d10fcf5914340fc609b82578ef608daafc0fc9a2320ced7f7ad18c9e812718b80546c7922a10bb63e282f5027681c8c2bb_1280.jpg",
      "imageWidth": 3966,
      "imageHeight": 2352,
      "imageSize": 860935,
      "views": 231716,
      "downloads": 139060,
      "collections": 631,
      "likes": 738,
      "comments": 129,
      "user_id": 2367988,
      "user": "kie-ker",
      "userImageURL": ""
    },
    {
      "id": 410311,
      "pageURL": "https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/",
      "type": "photo",
      "tags": "iphone, hand, screen",
      "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gc21d4b493419737725430a9175c220b1d8494f19867a80794a541405afdea7fa99fa23b61b036b35fbffd5d0aca18ce3_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g54d50c75bb62f1f89501c5047770356cd08962fba72abec670eaf258c5bfc019024c737f5ea059c724336fa319e79dda91f00f79cf1466dfc871d66d29f82cc8_1280.jpg",
      "imageWidth": 1920,
      "imageHeight": 1280,
      "imageSize": 416413,
      "views": 555170,
      "downloads": 279031,
      "collections": 641,
      "likes": 611,
      "comments": 167,
      "user_id": 264599,
      "user": "JESHOOTS-com",
      "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
    },
    {
      "id": 1776744,
      "pageURL": "https://pixabay.com/photos/apples-leaves-fall-still-life-1776744/",
      "type": "photo",
      "tags": "apples, leaves, fall",
      "previewURL": "https://cdn.pixabay.com/photo/2016/10/27/22/52/apples-1776744_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL": "https://pixabay.com/get/g2c3948129d5e482eada150a8074343e2d9aad338b2007f0cee34c48189cd10c656c02fba354cac056721bd02aa8a172199eb10ea82b7bb5552d6e3760d36804a_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL": "https://pixabay.com/get/g836c2bd3ac9e752745416d8d4671bf1f2c22086a021391dfc7a4b9ba51467bfec7d53e2a6540164f40390be8782e972c690af447e01b1a64e7c619707a05d60e_1280.jpg",
      "imageWidth": 4193,
      "imageHeight": 2798,
      "imageSize": 2002268,
      "views": 203443,
      "downloads": 122403,
      "collections": 696,
      "likes": 651,
      "comments": 92,
      "user_id": 2970404,
      "user": "castleguard",
      "userImageURL": "https://cdn.pixabay.com/user/2016/09/18/22-38-35-578_250x250.jpg"
    },
    {
      "id": 606761,
      "pageURL": "https://pixabay.com/photos/apple-imac-ipad-workplace-606761/",
      "type": "photo",
      "tags": "apple, imac, ipad",
      "previewURL": "https://cdn.pixabay.com/photo/2015/01/21/14/14/apple-606761_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/ge35def8496c8889cebbf01b283954fbf876ffb5c30b3ece8a032e989f436914fe757f75094ff09590f2340861f53638e_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 425,
      "largeImageURL": "https://pixabay.com/get/g27a0fef7584c6979044d7cc1069fe3b673feff806ee97534263618485a8928733b927c429058fbad4bbc67458384316eed664867a8ed33b0123e7d578a32227b_1280.jpg",
      "imageWidth": 4209,
      "imageHeight": 2796,
      "imageSize": 1649126,
      "views": 422356,
      "downloads": 232013,
      "collections": 666,
      "likes": 496,
      "comments": 116,
      "user_id": 663163,
      "user": "Firmbee",
      "userImageURL": "https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"
    },
    {
      "id": 2838921,
      "pageURL": "https://pixabay.com/photos/laptop-mockup-graphics-tablet-2838921/",
      "type": "photo",
      "tags": "laptop, mockup, graphics tablet",
      "previewURL": "https://cdn.pixabay.com/photo/2017/10/10/21/47/laptop-2838921_150.jpg",
      "previewWidth": 150,
      "previewHeight": 89,
      "webformatURL": "https://pixabay.com/get/g6a8d605f6b7593c3438119bbc5dcd1f68b8800976f1162688eeb309c0c514e3b994e7624df5b0cb652332953d3b23c955b29140864f8c3b09637fbec1ca94642_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 380,
      "largeImageURL": "https://pixabay.com/get/g0b6409e0f7ccec0cf42a5b751dfd5e960cd73c218a23928fe42cbad8efa2c12466b32cabcd029e6062690d270707173ea30fe9a47d1f9ca375ed3b7b77dc2f79_1280.jpg",
      "imageWidth": 5472,
      "imageHeight": 3252,
      "imageSize": 5820165,
      "views": 377254,
      "downloads": 224503,
      "collections": 685,
      "likes": 485,
      "comments": 108,
      "user_id": 4664461,
      "user": "lukasbieri",
      "userImageURL": "https://cdn.pixabay.com/user/2017/02/26/12-31-50-780_250x250.jpg"
    },
    {
      "id": 1872997,
      "pageURL": "https://pixabay.com/photos/apples-fruits-orchard-nature-trees-1872997/",
      "type": "photo",
      "tags": "apples, fruits, orchard",
      "previewURL": "https://cdn.pixabay.com/photo/2016/11/30/15/00/apples-1872997_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g321bacb2af1067e6e97d74ba6ecbc637a397885407d8de3f4a4873ab33c5cec98e1742a408e92b57dc255e228817b858e452027db7690999fb50735057d1c343_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/gb2ab6916382b49fe31bb1a1dbc62760a267c38f6c77d9de0b3c4360ae09e1bdbf306c9cecddd5e270483287633206e4b2d04d6e7c057012e5e98675fdad73d40_1280.jpg",
      "imageWidth": 3504,
      "imageHeight": 2336,
      "imageSize": 2019234,
      "views": 198369,
      "downloads": 123188,
      "collections": 620,
      "likes": 625,
      "comments": 90,
      "user_id": 3890388,
      "user": "lumix2004",
      "userImageURL": ""
    },
    {
      "id": 2788662,
      "pageURL": "https://pixabay.com/photos/apple-red-hand-apple-plantation-2788662/",
      "type": "photo",
      "tags": "apple, red, hand",
      "previewURL": "https://cdn.pixabay.com/photo/2017/09/26/13/42/apple-2788662_150.jpg",
      "previewWidth": 150,
      "previewHeight": 88,
      "webformatURL": "https://pixabay.com/get/g2f7f12a4de494b65744635f64008dfbb5f2f8c62576f0b624809783ca9e57689b7531ae57a21161bc3b66e56a7529085e623c1ebb9ff3c8c0f0a99398db1bb6c_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 377,
      "largeImageURL": "https://pixabay.com/get/g1a3ed6cbc934dee4372480321d1b5014eb94cb107958aa9b42db18f779f28863cf34f7956d645b0ae80c9bc1ad1526146b530988f5db3ecd4479e73e85af94d6_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 3539,
      "imageSize": 2042422,
      "views": 168155,
      "downloads": 97465,
      "collections": 588,
      "likes": 596,
      "comments": 88,
      "user_id": 2364555,
      "user": "NoName_13",
      "userImageURL": "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg"
    },
    {
      "id": 569153,
      "pageURL": "https://pixabay.com/photos/home-office-notebook-home-couch-569153/",
      "type": "photo",
      "tags": "home office, notebook, home",
      "previewURL": "https://cdn.pixabay.com/photo/2014/12/15/14/05/home-office-569153_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g2f55c7599f46e773f7ead82f4656ad0194e1a417791352ee93d79a67daee4e0cdc4dfd5456acce38f12f2c86e102a664_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/gf55c4b6278bcb3bd19f05319b7c19bd2cd34cec2dacc7b022d84864d77f6e51a6d9d37ab74cdc8cb44d97df00cddda55782c869f88d69a05a0f30ef2fd21930a_1280.jpg",
      "imageWidth": 5760,
      "imageHeight": 3840,
      "imageSize": 3991496,
      "views": 331012,
      "downloads": 176405,
      "collections": 664,
      "likes": 472,
      "comments": 90,
      "user_id": 364018,
      "user": "Life-Of-Pix",
      "userImageURL": "https://cdn.pixabay.com/user/2014/08/21/23-01-42-554_250x250.jpg"
    },
    {
      "id": 267948,
      "pageURL": "https://pixabay.com/photos/statue-of-liberty-new-york-statue-267948/",
      "type": "photo",
      "tags": "statue of liberty, new york, statue",
      "previewURL": "https://cdn.pixabay.com/photo/2014/02/17/10/20/statue-of-liberty-267948_150.jpg",
      "previewWidth": 150,
      "previewHeight": 84,
      "webformatURL": "https://pixabay.com/get/g0dd9c5198791a797de2ed6b09fa2b8af6a40b2472c82ec1c4598db259169df6eeddca0d642d160810bd9507e6182c782_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 359,
      "largeImageURL": "https://pixabay.com/get/g940526d0d32c605acbe930e1ce696f6dfb2a8ddaad16b0c5aaa3614cd5c9e6c7cee56622b092dadeb72c6329cd3b71595baef23d9bf78904ce7a45bfb6593ed2_1280.jpg",
      "imageWidth": 4000,
      "imageHeight": 2248,
      "imageSize": 1920397,
      "views": 463451,
      "downloads": 332466,
      "collections": 529,
      "likes": 569,
      "comments": 99,
      "user_id": 126846,
      "user": "Ronile",
      "userImageURL": "https://cdn.pixabay.com/user/2015/07/05/23-24-04-703_250x250.jpg"
    },
    {
      "id": 2788599,
      "pageURL": "https://pixabay.com/photos/apples-red-apple-ripe-apple-orchard-2788599/",
      "type": "photo",
      "tags": "apples, red apple, ripe",
      "previewURL": "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gcce15e22255c55431f59d31e64ab1294789a47261c0c920ced0c7020cceb7786a1649e73cbec8ae740abebd2c2b3ea4a1ecab8e39831d2a0cc04061e1262afd8_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g11d496089fe5f006462ac215789b98be03ea5ebb3bf712659cd9e5f46d81fb0fa69c8cfda198de770d3a60738fbf40d8190f4237bbf1930f302d9aba054b4b7b_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 4000,
      "imageSize": 3660484,
      "views": 135561,
      "downloads": 72430,
      "collections": 546,
      "likes": 610,
      "comments": 67,
      "user_id": 2364555,
      "user": "NoName_13",
      "userImageURL": "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg"
    },
    {
      "id": 2557571,
      "pageURL": "https://pixabay.com/photos/laptop-apple-macbook-computer-2557571/",
      "type": "photo",
      "tags": "laptop, apple, macbook",
      "previewURL": "https://cdn.pixabay.com/photo/2017/07/31/11/44/laptop-2557571_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g20590767871e369975e8957a30721b2d5c1ae13997bd9e37e6c667830f8bddb9331b118655a651e5544ce3ac3ff825267718fd26bfdc703bf131d398cf8849c1_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g76ba369215357e7e99a1a33785986405a43d39d03e0bb8a35c2e429207e5918a342556cf72e5dd554987b54abf1b21a6dc213a09bb0b0d144bef9229096c4455_1280.jpg",
      "imageWidth": 4460,
      "imageHeight": 2973,
      "imageSize": 780651,
      "views": 185798,
      "downloads": 110169,
      "collections": 664,
      "likes": 470,
      "comments": 66,
      "user_id": 894430,
      "user": "StockSnap",
      "userImageURL": "https://cdn.pixabay.com/user/2015/03/30/12-22-31-508_250x250.jpg"
    },
    {
      "id": 256263,
      "pageURL": "https://pixabay.com/photos/apple-books-classroom-red-apple-256263/",
      "type": "photo",
      "tags": "apple, books, classroom",
      "previewURL": "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256263_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gf250cecd8b8aae55893bbd210290d770257edfeb94c5ebafe5386f2a689e4e0d6c72dd4b6d295583eef9b3911f9c7dd8_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 423,
      "largeImageURL": "https://pixabay.com/get/g9de0870fdb21d4ff2bd5b67eb4ef31d62bf9e73ac2f417fe785d7d44222323e5f4876e59dc3fd256f2e71e72babcb83e3d6f368ad126aeb0342db705c91ec371_1280.jpg",
      "imageWidth": 4928,
      "imageHeight": 3264,
      "imageSize": 2864273,
      "views": 235295,
      "downloads": 123912,
      "collections": 566,
      "likes": 510,
      "comments": 103,
      "user_id": 143740,
      "user": "jarmoluk",
      "userImageURL": "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
    },
    {
      "id": 581131,
      "pageURL": "https://pixabay.com/photos/office-home-office-creative-apple-581131/",
      "type": "photo",
      "tags": "office, home office, creative",
      "previewURL": "https://cdn.pixabay.com/photo/2014/12/27/15/40/office-581131_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gd2d7d3ff99fb74f672d538b1e3070f96e13f773afd1db512ceb5e8bdf3e44c24dfce63887f6cf2639c44e6f60079caaa_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g2ad526d2ce886de02d12f52a1a0ed48771cdb127ddd6f4cb07c873d260b5f0f934759fad2d01f1bf6ef5e4feb15c6b00824a671a67ae5f2708b1927ae0b594ca_1280.jpg",
      "imageWidth": 5760,
      "imageHeight": 3840,
      "imageSize": 5987170,
      "views": 345505,
      "downloads": 197056,
      "collections": 655,
      "likes": 427,
      "comments": 84,
      "user_id": 670330,
      "user": "markusspiske",
      "userImageURL": "https://cdn.pixabay.com/user/2016/07/06/12-50-00-288_250x250.jpg"
    }
  ]
}''';
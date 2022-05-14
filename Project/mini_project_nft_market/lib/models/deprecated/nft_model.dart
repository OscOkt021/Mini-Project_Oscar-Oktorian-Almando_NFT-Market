// class NFTCollections {
//   NFTCollections({
//     required this.collections,
//   });
//   late final List<Collections> collections;

//   NFTCollections.fromJson(Map<String, dynamic> json) {
//     collections = List.from(json['collections'])
//         .map((e) => Collections.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['collections'] = collections.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Collections {
//   Collections({
//     this.bannerImageUrl,
//     this.chatUrl,
//     required this.createdDate,
//     required this.defaultToFiat,
//     this.description,
//     required this.safelistRequestStatus,
//     this.imageUrl,
//     required this.isSubjectToWhitelist,
//     this.largeImageUrl,
//     this.mediumUsername,
//     required this.name,
//     required this.openseaBuyerFeeBasisPoints,
//     required this.openseaSellerFeeBasisPoints,
//     this.payoutAddress,
//     required this.requireEmail,
//     this.shortDescription,
//     required this.slug,
//     this.telegramUrl,
//     this.twitterUsername,
//     this.instagramUsername,
//     this.wikiUrl,
//     required this.isNsfw,
//   });
//   late final Null bannerImageUrl;
//   late final Null chatUrl;
//   late final String createdDate;
//   late final bool defaultToFiat;
//   late final Null description;
//   late final String safelistRequestStatus;
//   late final Null imageUrl;
//   late final bool isSubjectToWhitelist;
//   late final Null largeImageUrl;
//   late final Null mediumUsername;
//   late final String name;
//   late final String openseaBuyerFeeBasisPoints;
//   late final String openseaSellerFeeBasisPoints;
//   late final Null payoutAddress;
//   late final bool requireEmail;
//   late final Null shortDescription;
//   late final String slug;
//   late final Null telegramUrl;
//   late final Null twitterUsername;
//   late final Null instagramUsername;
//   late final Null wikiUrl;
//   late final bool isNsfw;

//   Collections.fromJson(Map<String, dynamic> json) {
//     bannerImageUrl = null;
//     chatUrl = null;
//     createdDate = json['created_date'];
//     defaultToFiat = json['default_to_fiat'];
//     description = null;
//     safelistRequestStatus = json['safelist_request_status'];
//     imageUrl = null;
//     isSubjectToWhitelist = json['is_subject_to_whitelist'];
//     largeImageUrl = null;
//     mediumUsername = null;
//     name = json['name'];
//     openseaBuyerFeeBasisPoints = json['opensea_buyer_fee_basis_points'];
//     openseaSellerFeeBasisPoints = json['opensea_seller_fee_basis_points'];
//     payoutAddress = null;
//     requireEmail = json['require_email'];
//     shortDescription = null;
//     slug = json['slug'];
//     telegramUrl = null;
//     twitterUsername = null;
//     instagramUsername = null;
//     wikiUrl = null;
//     isNsfw = json['is_nsfw'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['banner_image_url'] = bannerImageUrl;
//     _data['chat_url'] = chatUrl;
//     _data['created_date'] = createdDate;
//     _data['default_to_fiat'] = defaultToFiat;
//     _data['description'] = description;
//     _data['safelist_request_status'] = safelistRequestStatus;
//     _data['image_url'] = imageUrl;
//     _data['is_subject_to_whitelist'] = isSubjectToWhitelist;
//     _data['large_image_url'] = largeImageUrl;
//     _data['medium_username'] = mediumUsername;
//     _data['name'] = name;
//     _data['opensea_buyer_fee_basis_points'] = openseaBuyerFeeBasisPoints;
//     _data['opensea_seller_fee_basis_points'] = openseaSellerFeeBasisPoints;
//     _data['payout_address'] = payoutAddress;
//     _data['require_email'] = requireEmail;
//     _data['short_description'] = shortDescription;
//     _data['slug'] = slug;
//     _data['telegram_url'] = telegramUrl;
//     _data['twitter_username'] = twitterUsername;
//     _data['instagram_username'] = instagramUsername;
//     _data['wiki_url'] = wikiUrl;
//     _data['is_nsfw'] = isNsfw;
//     return _data;
//   }
// }

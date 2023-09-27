import 'dart:convert';


 class UploadPhotoRequest {
 	final String uid;
	final String fileData;


	const UploadPhotoRequest({required this.fileData, required this.uid});

	Map<String, dynamic> toMap() => {
				'fileData': fileData,
				'uid': uid,
			};

	String toJson() => json.encode(toMap());

	UploadPhotoRequest copyWith({
		String? categoryUid,
		String? uid,
	}) {
		return UploadPhotoRequest(
			fileData: fileData ?? this.fileData,
			uid: uid ?? this.uid,
		);
	}
}

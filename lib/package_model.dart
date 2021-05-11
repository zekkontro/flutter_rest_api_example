class PackageModel {
  final String packageName;
  final String packageAuthor;
  final String packageLicense;
  final String packageDescription;
  final int likeCount;
  final List<dynamic> packageVersions;
  final String pubPoint;
  final String popularity;
  final String githubLink;

  PackageModel(
      {this.packageName,
      this.packageAuthor,
      this.packageLicense,
      this.packageDescription,
      this.likeCount,
      this.packageVersions,
      this.pubPoint,
      this.popularity,
      this.githubLink});

  factory PackageModel.fromMap(Map<String, dynamic> data) {
    return PackageModel(
        githubLink: data['github_link'],
        likeCount: int.parse(data['like_count']),
        packageAuthor: data['package_author'],
        packageDescription: data['package_description'],
        packageLicense: data['package-license'],
        packageName: data['package_name'],
        packageVersions: data['package_versions'],
        popularity: data['popularity'],
        pubPoint: data['pub_point']);
  }
}

class RelevantWork {
  final String title;
  final String role;
  final String description;
  final String? startDate;
  final String? endDate;
  final bool isCurrentRole;
  const RelevantWork({
    this.title = '',
    this.role = '',
    this.description = '', this.startDate, this.endDate, this.isCurrentRole = false
  });
}

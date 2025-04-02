class Project {
  String name;
  String manager;
  String cost;
  String description;
  String date;

  Project(
      {required this.name,
      this.manager = 'alqlam',
      this.cost = 'free',
      required this.date,
      required this.description});

  // remove this project from database!
  Future<void> add(databaseRef) async {
    /// need to add month later!
    final allProjects = databaseRef.child("allProjects").child(name + date);
    await allProjects.set({
      'name': name,
      'manager': manager,
      'cost': cost,
      'Description': description,
      'date': date,
    });
  }
}

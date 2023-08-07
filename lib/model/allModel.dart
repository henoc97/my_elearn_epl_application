

class GradationMd {
  final int id;
  final String nameGrad;

  GradationMd({required this.id, required this.nameGrad});
}


class FiliereMd {
  final int id;
  final String namefil;

  FiliereMd({required this.id, required this.namefil});

}

class DomaineMd {
  final int id;
  final String nameDomaine;
  final String descripDom;

  DomaineMd({required this.id, required this.nameDomaine, required this.descripDom});

}

class SimpleCourseMd {
  final int id;
  final String nameDomaine;
  final String nameSimpleCours;
  

  SimpleCourseMd({required this.id, required this.nameSimpleCours, required this.nameDomaine});

}

class SimpleCourseChoose {
  final int id;
  final int id1 ;
  final String courseName;

  SimpleCourseChoose({required this.id, required this.id1, required this.courseName});

}


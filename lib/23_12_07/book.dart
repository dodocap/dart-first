import 'package:intl/intl.dart';

class Book {
  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    required this.publishDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Book && runtimeType == other.runtimeType && title == other.title && publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  String toString() => '책{제목: $title, 출간일: ${_dateFormatter.format(publishDate)}, comment: $comment}';
}

void main() {
  final book1 = Book(title: '오브젝트', comment: 'comment', publishDate: DateTime(2019, 6, 17));
  final book2 = Book(title: '클린코드', comment: '번역:김XX', publishDate: DateTime(2013, 12, 24));
  final book3 = Book(title: '오준석의플러터생존코딩', comment: 'comment', publishDate: DateTime(2020, 3, 1));
  final book4 = Book(title: '될때까지안드로이드', comment: 'comment', publishDate: DateTime(2018, 3, 14));
  final book2Same = Book(title: '클린코드', comment: '번역:이XX', publishDate: DateTime(2013, 12, 24));

  print('$book2과 $book2Same는 ${book2 == book2Same ? '같다' : '다르다'}');
  print('------------------------------------------------------------------------------');

  final bookSet = {book1, book2, book3, book4, book2Same};
  print(bookSet);
  print('------------------------------------------------------------------------------');

}

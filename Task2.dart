import 'dart:io';

mixin PremiumRental{
  List<String?> PremiumAssets =[];
  void rentPremiumAsset({required String? assetName}){
    PremiumAssets.add(assetName);
    print("Premium Asset Rented: $assetName");
  }
}

class Book{
  String? BookName;
  int? BookID;

   Book({
    required this.BookName,
    required this.BookID,
  });

  String? getBookDetails(){
    return "Book Name: $BookName, Book ID: $BookID";
  }
}

class User{
  String? UserName;
  String? UserID;
  bool? IsActive;

  User({required this.UserName, required this.UserID, required this.IsActive});
  void BorrowBook(Book book){
    print("${UserName} borrowed the book: ${book.BookName}");
  }
}

class PremiumUser extends User with PremiumRental{
  PremiumUser({required String? UserName, required String? UserID, required bool? IsActive})
      : super(UserName: UserName, UserID: UserID, IsActive: IsActive);

  void BorrowPremiumBook(Book book){
    if (!book.BookName!.contains("Premium")) {
      print("${UserName} cannot borrow the book: ${book.BookName}. It is not a premium book.");
    } else {
      print("${UserName} borrowed the premium book: ${book.BookName}");
    }
  }
}

void main(){
  final NormalBook = Book(BookName: 'Normal Book', BookID: 101);
  final PremiumBook = Book(BookName:'Premium Book', BookID:102);

  final NUser = User(UserName: 'John Doe', UserID: 'U001', IsActive: true);
  final PUser = PremiumUser(UserName: 'Jane Smith', UserID: 'U002', IsActive: true);

  print("---------- Normal User ----------");
  NUser.BorrowBook(NormalBook);
  NUser.BorrowBook(PremiumBook);

  print("\n---------- Premium User ----------");
  PUser.BorrowBook(NormalBook);
  PUser.BorrowPremiumBook(PremiumBook);


}
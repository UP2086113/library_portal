import '../models/author.dart';
import '../models/author_review.dart';
import '../models/book.dart';
import '../models/book_review.dart';
import '../models/genre.dart';

List<Book> bookList = [
  Book(
    id: 64,
    name: "Harry Potter and the Half-Blood Prince",
    rating: 4,
    bio:
        "Set during Harry Potter's sixth year at Hogwarts, the novel explores the past of the boy wizard's nemesis, Lord Voldemort, and Harry's preparations for the final battle against Voldemort alongside his headmaster and mentor Albus Dumbledore.",
    imageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587697303l/1._SX318_.jpg",
    publishedDate: DateTime(2005, 7, 16),
    authorId: 62,
    genreId: [22, 2],
  ),
  Book(
    id: 67,
    name: "Harry Potter and the Chamber of Secrets",
    rating: 4,
    bio:
        "The plot follows Harry's second year at Hogwarts School of Witchcraft and Wizardry, during which a series of messages on the walls of the school's corridors warn that the 'Chamber of Secrets' has been opened and that the 'heir of Slytherin' would kill all pupils who do not come from all-magical families. These threats are found after attacks that leave residents of the school petrified. Throughout the year, Harry and his friends Ron and Hermione investigate the attacks.",
    imageUrl:
        "https://cdn.waterstones.com/bookjackets/large/9781/4088/9781408855669.jpg",
    publishedDate: DateTime(1998, 7, 2),
    authorId: 62,
    genreId: [22, 2],
  ),
  // Add more books here...
  Book(
    id: 76,
    name: "Three Daughters of Eve",
    rating: 4,
    bio:
        "The book centers on a wealthy, middle-aged housewife, her childhood in Istanbul and her time as a student at Oxford University where she fell in love with a philosophy professor.",
    imageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1475402189l/32329649._SY475_.jpg",
    publishedDate: DateTime(2016, 6, 2),
    authorId: 61,
    genreId: [22, 23, 2],
  ),
  Book(
    id: 61,
    name: "Harry Potter and the Philosopher's Stone",
    rating: 5,
    bio:
        "It describes how Harry discovers he is a wizard, makes close friends and a few enemies at the Hogwarts School of Witchcraft and Wizardry, and with the help of his friends thwarts an attempted comeback by the evil wizard Voldemort, who killed Harry's parents and tried to kill Harry when he was one year old.",
    imageUrl:
        "https://cdn.waterstones.com/bookjackets/large/9781/4088/9781408855652.jpg",
    publishedDate: DateTime(2001, 11, 4),
    authorId: 62,
    genreId: [2, 22],
  ),
  Book(
    id: 62,
    name: "Harry Potter and the Goblet of Fire",
    rating: 5,
    bio:
        "It follows Harry Potter, a wizard in his fourth year at Hogwarts School of Witchcraft and Wizardry, and the mystery surrounding the entry of Harry's name into the Triwizard Tournament, in which he is forced to compete.",
    imageUrl:
        "https://embed.cdn.pais.scholastic.com/v1/channels/sso/products/identifiers/isbn/9780545582957/primary/renditions/700?useMissingImage=true",
    publishedDate: DateTime(2000, 7, 8),
    authorId: 62,
    genreId: [2, 22],
  ),
  Book(
    id: 65,
    name: "Harry Potter and the Order of the Phoenix",
    rating: 5,
    bio:
        "It follows Harry Potter's struggles through his fifth year at Hogwarts School of Witchcraft and Wizardry, including the surreptitious return of the antagonist Lord Voldemort, O.W.L. exams, and an obstructive Ministry of Magic.",
    imageUrl:
        "https://cdn.waterstones.com/bookjackets/large/9781/4088/9781408855690.jpg",
    publishedDate: DateTime(2003, 6, 21),
    authorId: 62,
    genreId: [2, 22],
  ),
  Book(
    id: 72,
    name: "How to Stop Worrying and Start Living",
    rating: 4,
    bio:
        "The book's goal is to lead the reader to a more enjoyable and fulfilling life, helping them to become more aware of, not only themselves, but others around them. Carnegie tries to address the everyday nuances of living, in order to get the reader to focus on the more important aspects of life. It is now a world-famous, self-help book amongst many people.",
    imageUrl:
        "https://images-eu.ssl-images-amazon.com/images/I/41VDS6f7C3L._SY445_QL70_ML2_.jpg",
    publishedDate: DateTime(1948, 1, 1),
    authorId: 63,
    genreId: [1, 41],
  ),
  // Add more books here...
  Book(
    id: 68,
    name: "Carrie",
    rating: 5,
    bio:
        "The story of misfit high-school girl, Carrie White, who gradually discovers that she has telekinetic powers. Repressed by a domineering, ultra-religious mother and tormented by her peers at school, her efforts to fit in lead to a dramatic confrontation during the senior prom.",
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/51eYJY7IRFL.jpg",
    publishedDate: DateTime(1974, 4, 5),
    authorId: 64,
    genreId: [3, 22],
  ),
  Book(
    id: 70,
    name: "The Stand",
    rating: 4,
    bio:
        "The Stand is a post-apocalyptic dark fantasy novel written by American author Stephen King and first published in 1978 by Doubleday. The plot centers on a pandemic of a weaponized strain of influenza that kills almost the entire world population.",
    imageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1371414486l/5864120.jpg",
    publishedDate: DateTime(1978, 10, 3),
    authorId: 63,
    genreId: [2, 3, 22],
  )
];

List<BookReview> bookReviews = [
  BookReview(
    text:
        "Set during Harry Potter's sixth year at Hogwarts, the novel explores the past of the boy wizard's nemesis, Lord Voldemort, and Harry's preparations for the final battle against Voldemort alongside his headmaster and mentor Albus Dumbledore.",
    rating: 4,
    date: DateTime(2005, 7, 16),
    bookId: 64,
    mId: 1,
    mFirstName: "John",
    mLastName: "Doe",
    mImageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587697303l/1._SX318_.jpg",
  ),
  BookReview(
    text:
        "The plot follows Harry's second year at Hogwarts School of Witchcraft and Wizardry, during which a series of messages on the walls of the school's corridors warn that the 'Chamber of Secrets' has been opened and that the 'heir of Slytherin' would kill all pupils who do not come from all-magical families. These threats are found after attacks that leave residents of the school petrified. Throughout the year, Harry and his friends Ron and Hermione investigate the attacks.",
    rating: 4,
    date: DateTime(1998, 7, 2),
    bookId: 67,
    mId: 2,
    mFirstName: "Jane",
    mLastName: "Smith",
    mImageUrl:
        "https://cdn.waterstones.com/bookjackets/large/9781/4088/9781408855669.jpg",
  ),
  // Add more book reviews here...
  BookReview(
    text:
        "It is a 1986 horror novel by American author Stephen King. It was his 22nd book, and his 17th novel written under his own name. The story follows the experiences of seven children as they are terrorized by an evil entity that exploits the fears of its victims to disguise itself while hunting its prey.",
    rating: 5,
    date: DateTime(1986, 9, 15),
    bookId: 69,
    mId: 3,
    mFirstName: "David",
    mLastName: "Johnson",
    mImageUrl:
        "https://lareviewofbooks-org-cgwbfgl6lklqqj3f4t3.netdna-ssl.com/wp-content/uploads/2016/09/paavpdqsbtggtmn4smxs.png",
  ),
  BookReview(
    text:
        "The core idea is that you can change other people's behavior simply by changing your own. It teaches you the principles to better understand people, become a more likable person, improve relationships, win others over, and influence behavior through leadership.",
    rating: 4,
    date: DateTime(1936, 10, 4),
    bookId: 71,
    mId: 4,
    mFirstName: "Sarah",
    mLastName: "Williams",
    mImageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388410533l/33288.jpg",
  ),
  BookReview(
    text:
        "The book centers on a wealthy, middle-aged housewife, her childhood in Istanbul and her time as a student at Oxford University where she fell in love with a philosophy professor.",
    rating: 4,
    date: DateTime(2016, 6, 2),
    bookId: 76,
    mId: 5,
    mFirstName: "Emily",
    mLastName: "Anderson",
    mImageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1475402189l/32329649._SY475_.jpg",
  ),
  BookReview(
    text:
        "It describes how Harry discovers he is a wizard, makes close friends and a few enemies at the Hogwarts School of Witchcraft and Wizardry, and with the help of his friends thwarts an attempted comeback by the evil wizard Voldemort, who killed Harry's parents and tried to kill Harry when he was one year old.",
    rating: 5,
    date: DateTime(2001, 11, 4),
    bookId: 61,
    mId: 6,
    mFirstName: "Michael",
    mLastName: "Brown",
    mImageUrl:
        "https://cdn.waterstones.com/bookjackets/large/9781/4088/9781408855652.jpg",
  ),
];

List<Author> authorsList = [
  Author(
    id: 64,
    firstName: "Stephen",
    lastName: "King",
    age: 73,
    country: "USA",
    rating: 4,
    imageUrl: "https://images.gr-assets.com/authors/1362814142p8/3389.jpg",
  ),
  Author(
    id: 61,
    firstName: "Elif",
    lastName: "Shaikh",
    age: 49,
    country: "FRA",
    rating: 5,
    imageUrl:
        "https://i.pinimg.com/originals/c7/23/60/c72360ea2d9d658cdbcf6e2ec3ad0d4a.jpg",
  ),
  // Add more authors here...
  Author(
    id: 62,
    firstName: "Joanne",
    lastName: "Rowling",
    age: 55,
    country: "GBR",
    rating: 5,
    imageUrl:
        "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTE1ODA0OTcxMzcxNTYyNTA5/jk-rowling-40998-1-402.jpg",
  ),
  Author(
    id: 63,
    firstName: "Dale",
    lastName: "Carnegie",
    age: 67,
    country: "USA",
    rating: 4,
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/en/0/0c/Dale_Carnegie.jpg",
  ),
  // Add more authors here...
];

List<Genre> genres = [
  Genre(id: 2, name: "Fantasy"),
  Genre(id: 41, name: "Non-Fiction"),
  Genre(id: 23, name: "Drama"),
  Genre(id: 3, name: "Horror"),
  Genre(id: 1, name: "Entrepreneurship"),
  Genre(id: 22, name: "Fiction"),
];

List<AuthorReview> authorReviews = [
  AuthorReview(
    text: "Great author with insightful ideas.",
    rating: 5,
    date: DateTime(2022, 5, 15),
    aId: 64,
    mId: 123,
    mFirstName: "John",
    mLastName: "Doe",
    mImageUrl: "https://example.com/profile_image.jpg",
  ),
  AuthorReview(
    text:
        "I absolutely love the author's storytelling. Each book keeps me captivated from beginning to end.",
    rating: 5,
    date: DateTime(2023, 4, 20),
    aId: 62,
    mId: 789,
    mFirstName: "Sarah",
    mLastName: "Johnson",
    mImageUrl: "https://example.com/profile_image.jpg",
  ),
  AuthorReview(
    text:
        "The author's writing style is remarkable. I can't wait to read more of their work!",
    rating: 4,
    date: DateTime(2023, 6, 5),
    aId: 62,
    mId: 987,
    mFirstName: "Michael",
    mLastName: "Brown",
    mImageUrl: "https://example.com/profile_image.jpg",
  ),
  AuthorReview(
    text: "I didn't enjoy the author's writing style.",
    rating: 2,
    date: DateTime(2021, 9, 10),
    aId: 64,
    mId: 456,
    mFirstName: "Jane",
    mLastName: "Smith",
    mImageUrl: "https://example.com/profile_image.jpg",
  ),
  // Add more author reviews here...
];

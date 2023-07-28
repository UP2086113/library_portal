import 'package:logger/logger.dart';

import '../../models/author.dart';
import '../../models/author_review.dart';
import '../../models/book.dart';
import '../../models/book_review.dart';
import '../../models/genre.dart';

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
        "https://d5i0fhmkm8zzl.cloudfront.net/9780545582957_harry_potter_and_the_goblet_of_fire_0_0.jpg",
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
  ),

  Book(
    id: 1,
    authorId: 1,
    genreId: [4, 5],
    name: "The Adventures of Sherlock Holmes",
    rating: 4,
    bio:
        "A collection of 12 stories about the famous detective Sherlock Holmes and his partner Dr. Watson, who solve a variety of mysteries, including murders, thefts, and missing persons cases. The stories are set in late 19th-century London and feature Holmes's keen observational skills and deductive reasoning.",
    imageUrl:
        "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1665689329-41fqfwTqojL._SL500_.jpg",
    publishedDate: DateTime(1892),
    issueDate: DateTime(2023),
    returnedOn: null,
  ),
  Book(
    id: 2,
    authorId: 2,
    genreId: [6, 7],
    name: "Pride and Prejudice",
    rating: 4,
    bio:
        "A novel of manners that follows the lives of Elizabeth Bennet and her family as they navigate the social conventions of 19th-century England. The story is set in the fictional town of Meryton, Hertfordshire, and follows the Bennet family as they try to find suitable husbands for their five daughters.",
    imageUrl:
        "https://royalreadingroom.uk/wp-content/uploads/2022/04/Jane-Austen-Pride-And-Prejudice-Book-Cover.jpg",
    publishedDate: DateTime(1813),
    issueDate: DateTime.now(),
    returnedOn: null,
  ),
  Book(
    id: 3,
    authorId: 3,
    genreId: [23, 6],
    name: "The Great Gatsby",
    rating: 4,
    bio:
        "A novel about the American Dream and the pursuit of wealth and status, set in the Jazz Age of the 1920s. The story follows Jay Gatsby, a wealthy man who throws lavish parties in his mansion in West Egg, Long Island. Gatsby is obsessed with Daisy Buchanan, a woman he met and fell in love with five years earlier.",
    imageUrl:
        "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982146702/the-great-gatsby-9781982146702_hr.jpg",
    publishedDate: DateTime(1925),
    issueDate: DateTime.now(),
    returnedOn: null,
  ),
  Book(
    id: 4,
    authorId: 4,
    genreId: [8, 22],
    name: "To Kill a Mockingbird",
    rating: 4,
    bio:
        "A novel about a young girl named Scout who learns about racism and courage as she witnesses her father defend a black man accused of rape in the Jim Crow South. The story is set in the fictional town of Maycomb, Alabama, in the 1930s.",
    imageUrl:
        "https://cdn.britannica.com/21/182021-050-666DB6B1/book-cover-To-Kill-a-Mockingbird-many-1961.jpg",
    publishedDate: DateTime(1960),
    issueDate: null,
    returnedOn: null,
  ),

  Book(
    id: 5,
    authorId: 5,
    genreId: [2, 4, 5],
    name: "The Lord of the Rings",
    rating: 5,
    bio:
        "A fantasy novel about a hobbit named Frodo Baggins who sets out on a quest to destroy the One Ring, an evil artifact that threatens to destroy Middle-earth. The story is set in the fictional world of Middle-earth, and follows Frodo and his companions as they journey to Mount Doom, the only place where the Ring can be destroyed.",
    imageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1566425108l/33.jpg",
    publishedDate: DateTime(1954),
    issueDate: DateTime(2023),
    returnedOn: null,
  ),
  Book(
    id: 6,
    authorId: 6,
    genreId: [4, 8],
    name: "The Hitchhiker's Guide to the Galaxy",
    rating: 4,
    bio:
        "A comedy science fiction series about a hapless Englishman named Arthur Dent who escapes Earth's destruction and travels through space with his friend Ford Prefect, who is actually an alien researcher who was stranded on Earth for fifteen years while gathering information for the titular Hitchhiker's Guide to the Galaxy.",
    imageUrl:
        "https://s3.amazonaws.com/marquee-test-akiaisur2rgicbmpehea/li9MaBLHQxC2tfSY0tMJ_hitch1.jpg",
    publishedDate: DateTime(1979),
    issueDate: null,
    returnedOn: null,
  ),
  Book(
    id: 7,
    authorId: 7,
    genreId: [4, 5],
    name: "The Da Vinci Code",
    rating: 4,
    bio:
        "A thriller novel about a murder that takes place in the Louvre Museum and a conspiracy involving the Holy Grail. The story follows Robert Langdon, a professor of symbology at Harvard University, as he tries to solve the mystery of the murder and uncover the truth about the Holy Grail.",
    imageUrl:
        "https://www.booksplus.pk/wp-content/uploads/2019/05/the-da-vinci-code-dan-brown.jpg",
    publishedDate: DateTime(2003),
    issueDate: DateTime.now().subtract(const Duration(days: 8)),
    returnedOn: null,
  ),
  Book(
    id: 8,
    authorId: 8,
    genreId: [2, 3, 8],
    name: "The Hunger Games",
    rating: 4,
    bio:
        "A dystopian novel about a young girl named Katniss Everdeen who volunteers to take her younger sister's place in a deadly competition called the Hunger Games. The story is set in a dystopian future where children are forced to fight to the death in an annual televised event.",
    imageUrl:
        "https://www.thebookshop.es/productimages/1200/the-hunger-games---suzanne-collins_269889.jpg",
    publishedDate: DateTime(2008),
    issueDate: DateTime.now().subtract(const Duration(days: 8)),
    returnedOn: null,
  ),
  Book(
    id: 9,
    authorId: 64,
    genreId: [2, 6, 9],
    name: "Harry Potter and the Sorcerer's Stone",
    rating: 4,
    bio:
        "A fantasy novel about a young boy named Harry Potter who discovers that he is a wizard and attends Hogwarts School of Witchcraft and Wizardry. The story follows Harry as he learns about magic, makes new friends, and faces off against the evil Lord Voldemort. The book is the first in the Harry Potter series, which has become one of the most popular and successful book series of all time.",
    imageUrl: "https://m.media-amazon.com/images/I/51Ppi-8kISL.jpg",
    publishedDate: DateTime(1997),
    issueDate: DateTime(2023),
    returnedOn: DateTime(2023, 6, 10),
  ),
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
      id: 1,
      age: 75,
      rating: 4,
      firstName: "Arthur",
      lastName: "Conan Doyle",
      country: "United Kingdom",
      imageUrl:
          "https://www.arthur-conan-doyle.com/images/thumb/1/11/1901-arthur-conan-doyle-election-standing-for-parliament-drawing.jpg/290px-1901-arthur-conan-doyle-election-standing-for-parliament-drawing.jpg"),
  Author(
      id: 2,
      age: 93,
      rating: 4,
      firstName: "Jane",
      lastName: "Austen",
      country: "United Kingdom",
      imageUrl:
          "https://www.bookedforlife.in/wp-content/uploads/2017/12/jane-austen.jpg"),
  Author(
    id: 62,
    firstName: "Joanne",
    lastName: "Rowling",
    age: 73,
    country: "United Kingdom",
    rating: 5,
    imageUrl:
        "https://jkrowling.com/wp-content/uploads/2016/12/JKROWLINGPR_S01_00057_V4.jpg",
  ),
  Author(
      id: 3,
      age: 46,
      rating: 4,
      firstName: "Francis Scott",
      lastName: "Fitzgerald",
      country: "United States",
      imageUrl:
          "https://www.onthisday.com/images/people/f-scott-fitzgerald.jpg"),
  Author(
      id: 4,
      age: 90,
      rating: 4,
      firstName: "Harper",
      lastName: "Lee",
      country: "United States",
      imageUrl:
          "https://www.thefamouspeople.com/profiles/images/harper-lee-5.jpg"),
  Author(
      id: 5,
      age: 102,
      rating: 5,
      firstName: "J.R.R.",
      lastName: "Tolkien",
      country: "United Kingdom",
      imageUrl:
          "https://www.onthisday.com/images/people/f-scott-fitzgerald.jpg"),
  Author(
      id: 6,
      age: 61,
      rating: 4,
      firstName: "Douglas",
      lastName: "Adams",
      country: "England",
      imageUrl:
          "https://ffrf.org/media/k2/items/cache/55dab641276be98081e9404b57d3914a_S.jpg"),
  Author(
      id: 7,
      age: 59,
      rating: 4,
      firstName: "Dan",
      lastName: "Brown",
      country: "United States",
      imageUrl:
          "https://danbrown.com/wp-content/themes/danbrown/images/db/slideshow/author/db.courter.02.jpg"),
  Author(
      id: 8,
      age: 49,
      rating: 4,
      firstName: "Suzanne",
      lastName: "Collins",
      country: "United States",
      imageUrl:
          "https://hips.hearstapps.com/hmg-prod/images/suzanne-collins.jpg"),
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
];

List<Genre> genreList = [
  Genre(id: 2, name: "Fantasy"),
  Genre(id: 41, name: "Non-Fiction"),
  Genre(id: 23, name: "Drama"),
  Genre(id: 3, name: "Horror"),
  Genre(id: 1, name: "Entrepreneurship"),
  Genre(id: 22, name: "Fiction"),
  Genre(id: 4, name: "Mystery"),
  Genre(id: 5, name: "Detective Fiction"),
  Genre(id: 6, name: "Romance"),
  Genre(id: 7, name: "Comedy of Manners"),
  Genre(id: 8, name: "Coming-of-Age"),
  Genre(id: 9, name: "Legal Fiction"),
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

Logger log = Logger();

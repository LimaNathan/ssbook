const String getBooks = """
         query GetBooks{
            favoriteBooks{
              cover
              name
              author {name}
              description
              isFavorite
            }
            allBooks{
              name
              author{name}
              cover
              category
              id
              isFavorite
              description
            }
            favoriteAuthors{
              name
              picture
              booksCount
            }
          }

""";
 

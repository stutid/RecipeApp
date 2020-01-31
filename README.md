# RecipeApp
RecipeApp is an iOS application to display a list of recipes and show their details using Contentful (Content Delivery API).

The app uses:
- Swift 5
- MVVM design architecture
- URLSession to make network calls
- Image caching to display images faster


The app has:
- Recipe List View
   - Recipe List displays a list of all the recipes (recipe image and recipe name) from the Contentful API which have field title value in JSON response.
- Recipe Detail View
  - Recipe Detail displays a detailed information for a selected recipe (recipe image, recipe name, recipe description and recipe calorie count)


The app displays:
- Recipe Image
- Recipe Name
- Recipe Description
- Calories Count

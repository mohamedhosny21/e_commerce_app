const express = require('express');
const i18n = require('i18n');
const app = express();
const fs = require('fs');
const path = require('path');

// Configure i18n
i18n.configure({
  locales: ['en', 'ar'],
  directory: path.join(__dirname, 'api_locales'),
  defaultLocale: 'en',
  queryParameter: 'lang',
  objectNotation: true,
});

// Initialize i18n
app.use(i18n.init);

// Load the pizza data
const pizzaData = JSON.parse(fs.readFileSync(path.join(__dirname, 'db.json'), 'utf-8'));

// Arabic to English category mapping
const categoryMappings = {
  "بيتزا نباتية": "Vegetarian Pizza",
  "بيتزا ببروني": "Pepperoni Pizza",
  "بيتزا هاواي": "Hawaiian Pizza",
  "بيتزا أربع أجبان": "Four Cheese Pizza",
  "بيتزا مارغريتا": "Margherita Pizza",
  "بيتزا الدجاج المشوي": "BBQ Chicken Pizza"
};

// Endpoint to get localized pizzas
app.get('/allpizza', (req, res) => {
  const lang = req.query.lang || 'en';
  const category = decodeURIComponent(req.query.category || ''); // Decode URI component
  i18n.setLocale(lang);

  console.log('Detected language:', lang);
  console.log('Requested category:', category);

  // Translate Arabic category to English
  const englishCategory = categoryMappings[category] || category;
  console.log('English category for filtering:', englishCategory);

  // Filter pizzas by the translated category
  let filteredPizzas = pizzaData.allpizza;

  if (englishCategory) {
    filteredPizzas = filteredPizzas.filter(pizza => pizza.category === englishCategory);
    console.log('Filtered Pizzas:', filteredPizzas); // Debug print
  }

  // Localize the filtered pizza data
  const localizedPizzas = filteredPizzas.map(pizza => ({
    ...pizza,
    name: i18n.__(`pizza.name.${pizza.name}`),
    menu_description: i18n.__(`pizza.description.${pizza.menu_description}`),
    category: i18n.__(`pizza.category.${pizza.category}`)
  }));

  res.json({ allpizza: localizedPizzas });
  console.log('Localized Pizzas:', localizedPizzas); // Debug print
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});

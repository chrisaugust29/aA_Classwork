
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogNav = document.getElementsByClassName('drop-down-dog-nav');

function dogLinkCreator(dogs) {
  // const dogLink = Object.values(dogs);
  const dogName = Object.keys(dogs);

  const a = document.createElement("a");
  dogName.forEach(name => {
    a.innerHTML = name;
    a.href = dogs[name];
  });

  const dogLink = document.createElement("li");
  const link = dogLink.className("dog-link");
  dogNav.append(link);
  // dogLink.appendChild(a)
}


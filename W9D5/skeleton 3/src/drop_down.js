
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

// const dogNav = document.getElementsByClassName('drop-down-dog-nav');

const dogLinkCreator = (dogs) => {

  const dogLink = [];
  const dogName = Object.keys(dogs);


  dogName.forEach(name => {
    const a = document.createElement("a");
    a.innerHTML = name;
    a.href = dogs[name];
 

  const li = document.createElement("li");
   li.classList = "dog-link";
    li.appendChild(a);
    dogLink.push(li);
  })
    return dogLink;
}

const attachDogLinks = () => {
  const ulClass = document.querySelector(".drop-down-dog-list")
  const dogLinks = dogLinkCreator(dogs);
  dogLinks.forEach(link => ulClass.appendChild(link));

}
attachDogLinks();

const handleLeave = () => {
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(el => el.classList.toggle('gone'))
}

const handleEnter = () => {
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(el => el.classList.toggle('tada'))
}
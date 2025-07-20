const outfits = [
  {
    username: "Joane",
    img: "assets/outfit1.jpg",
    description: "Techwear noir avec cargos et hoodie oversize."
  },
  {
    username: "Lina",
    img: "assets/outfit2.jpg",
    description: "Look vintage avec jeans taille haute et veste en cuir."
  }
];

const feed = document.getElementById("feed");

outfits.forEach(outfit => {
  const card = document.createElement("div");
  card.className = "outfit-card";
  card.innerHTML = `
    <img src="${outfit.img}" alt="Outfit" style="width:100%; border-radius: 5px;">
    <h3>${outfit.username}</h3>
    <p>${outfit.description}</p>
  `;
  feed.appendChild(card);
});
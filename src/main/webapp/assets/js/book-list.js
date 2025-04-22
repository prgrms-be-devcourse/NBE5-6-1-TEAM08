let page = 1;
const size = 3;

const cloneElement = data => {
  const clone = document.querySelector('#bookList').firstElementChild.cloneNode(true);
  const thumbnail = clone.querySelector('.thumbnail');
  const title = clone.querySelector('.title');
  const author = clone.querySelector('.author');

  thumbnail.src = data.thumbnail ? data.thumbnail : '#';
  title.textContent = data.title;
  author.textContent = data.author;
  return clone;

}

const intersectionObserver = new IntersectionObserver(async function (entries) {
    const response = await fetch(`https://localhost:8080/api/book/list?page=${++page}&size${size}`)
    const data = await response.json();
    console.dir(data);
    const books = data.data.bookInfos;

    // offset data 없을 때 옵저버 해제
    if (!books) {
      intersectionObserver.unobserve(document.querySelector(".page-footer"));
    }

    books.forEach(e => {
      const clone = createBook(e);
      document.querySelector('.book-list').appendChild(clone);
    })
});

intersectionObserver.observe(document.querySelector(".page-footer"));

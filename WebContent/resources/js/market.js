 // JavaScript를 사용하여 상품 목록 이동 구현
  let currentIndex = 0;
  const items = document.querySelectorAll('.dc2');
  const itemCount = items.length;
  
  function showItems(startIndex) {
    for (let i = 0; i < itemCount; i++) {
      items[i].style.display = 'none';
    }
    
    for (let i = startIndex; i < startIndex + 3; i++) {
      if (i < itemCount) {
        items[i].style.display = 'block';
      }
    }
  }
  
  function nextItems() {
    currentIndex += 3;
    if (currentIndex >= itemCount) {
      currentIndex = 0;
    }
    showItems(currentIndex);
  }
  
  function prevItems() {
    currentIndex -= 3;
    if (currentIndex < 0) {
      currentIndex = itemCount - 3;
    }
    showItems(currentIndex);
  }
document.addEventListener('DOMContentLoaded', function() {
	const deleteButtons = document.querySelectorAll('button[data-wishlist-id]');
	deleteButtons.forEach(button => {
		button.addEventListener('click', function() {
			const wishListId = this.getAttribute('data-wishlist-id');
			if (confirm('정말 삭제하시겠습니까?')) {
				fetch(`/wishlist/delete/${wishListId}`, {
					method: 'POST'
				})
					.then(response => response.json())
					.then(data => {
						if (data.success) {
							alert('삭제되었습니다.');
							// 삭제된 항목의 DOM 요소를 찾아서 삭제
							const trToDelete = this.closest('tr');
							trToDelete.remove();
							if (document.querySelectorAll('table.cart--table tbody tr').length === 0) {
								location.href = '/member/cartList'; // 리디렉션
							}
						} else {
							alert('삭제에 실패했습니다.');
						}
					})
					.catch(error => console.error('Error:', error));
			}
		});
	});
	
	const purchaseBtn = document.getElementById('cart--purchase--btn');
	purchaseBtn.addEventListener('click', function(e){

        

        e.preventDefault();

        let sendForm = document.getElementById('send--detail--form');
        
        sendForm.action = '/order';
        sendForm.method = 'GET';
        
        sendForm.submit();
        
    });

});
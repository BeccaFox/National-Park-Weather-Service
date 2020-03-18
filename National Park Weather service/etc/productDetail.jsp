<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/common/header.jsp">
	<c:param name="pageTitle" value="Product Details" />
</c:import>

<!-- Container for the Product -->
<!-- The current product is available using the `product` variable -->
<div id="product-detail">
	<img src="<c:url value="/images/product-images/${product.imageName}" />" />
	<div class="product-description">
		<h3>"${product.name}"</h3>

		<!-- .filled will make the star solid -->
		<div class="rating">
			<c:choose>
				<c:when test="${product.averageRating == 0}">
					<span>&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
				</c:when>
				<c:when
					test="${product.averageRating >= 1 && product.averageRating < 2}">	
					<span class="filled">&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
				</c:when>
				<c:when
					test="${product.averageRating >= 2 && product.averageRating < 3}">
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
				</c:when>
				<c:when
					test="${product.averageRating >= 3 && product.averageRating < 4}">
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span>&#9734;</span>
					<span>&#9734;</span>
				</c:when>
				<c:when
					test="${product.averageRating >= 4 && product.averageRating < 5}">
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span>&#9734;</span>
				</c:when>
				<c:when test="${product.averageRating == 5}">
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
					<span class="filled">&#9734;</span>
				</c:when>
			</c:choose>
		</div>

		<!-- Include this if the product has a Remaining Stock of 5 or less -->
			<c:if test="${product.remainingStock <= 5 && product.remainingStock > 0}">
				<p class="alert-remaining">BUY NOW! Only
					${product.remainingStock} left!</p>
			</c:if>
				<p class="description">${product.description}</p>
				<p class="price">$${product.price.intValue()}</p>

		<!-- If item is in stock -->
		<c:choose>
			<c:when test="${product.remainingStock > 0}">
				<button class="action">Add to Cart</button>
			</c:when>
			<c:when test="${product.remainingStock == 0}">
				<button disabled>Sold Out</button>
			</c:when>
		</c:choose>
		<!-- OR if item is out of stock -->
		<!--<button disabled>Sold Out</button>-->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
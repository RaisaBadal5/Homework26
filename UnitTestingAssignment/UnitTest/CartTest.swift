//
//  CartTest.swift
//  UnitTestingAssignment
//
//  Created by Default on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class CartTest: XCTestCase {

    var sut: CartViewModel!

    override func setUpWithError() throws {
        sut = CartViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchProducts() {
    
        let mockProducts = [Product(id: 1, name: "Product 1", price: 10.0, selectedQuantity: 1),
                            Product(id: 2, name: "Product 2", price: 20.0, selectedQuantity: 2)]
        let mockNetworkManager = MockNetworkManager(products: .success(mockProducts))
        sut.networkManager = mockNetworkManager

        sut.fetchProducts()

  
        XCTAssertEqual(sut.allProducts?.count, 2)
    }

    func testAddProduct() {
       
        let mockProduct = Product(id: 1, name: "Product 1", price: 10.0, selectedQuantity: 1)
        sut.allProducts = [mockProduct]

        sut.addProduct(withID: 1)

        XCTAssertEqual(sut.selectedProducts.count, 1)
        XCTAssertEqual(sut.selectedProducts.first?.selectedQuantity, 1)
    }

    func testAddRandomProduct() {
        
        let mockProducts = [Product(id: 1, name: "Product 1", price: 10.0, selectedQuantity: 1),
                            Product(id: 2, name: "Product 2", price: 20.0, selectedQuantity: 2)]
        sut.allProducts = mockProducts

        sut.addRandomProduct()

        XCTAssertEqual(sut.selectedProducts.count, 1)
    }

    func testRemoveProduct() {

        let mockProduct = Product(id: 1, name: "Product 1", price: 10.0, selectedQuantity: 1)
        sut.selectedProducts = [mockProduct]

        sut.removeProduct(withID: 1)

        XCTAssertEqual(sut.selectedProducts.count, 0)
    }

    func testClearCart() {

        let mockProducts = [Product(id: 1, name: "Product 1", price: 10.0, selectedQuantity: 1),
                            Product(id: 2, name: "Product 2", price: 20.0, selectedQuantity: 2)]
        sut.selectedProducts = mockProducts

        sut.clearCart()

        XCTAssertEqual(sut.selectedProducts.count, 0)
    }

    func testSelectedItemsQuantity() {

        let mockProducts = [Product(id: 1, name: "Product 1", price: 10.0, selectedQuantity: 1),
                            Product(id: 2, name: "Product 2", price: 20.0, selectedQuantity: 2)]
        sut.selectedProducts = mockProducts

        let quantity = sut.selectedItemsQuantity

        XCTAssertEqual(quantity, 3)
    }

    func testTotalPrice() {

        let mockProducts = [Product(id: 1, name: "Product 1", price: 10.0, selectedQuantity: 1),
                            Product(id: 2, name: "Product 2", price: 20.0, selectedQuantity: 2)]
        sut.selectedProducts = mockProducts

        let totalPrice = sut.totalPrice

        XCTAssertEqual(totalPrice, 50.0)
    }
}

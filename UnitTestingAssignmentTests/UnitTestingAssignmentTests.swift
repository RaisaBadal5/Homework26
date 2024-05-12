//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Default on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var viewModel: CartViewModel!
    
    override func setUpWithError() throws {
        viewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    //MARK: - testAddProduct_withID
    func testAddProduct_withID() {
        let product = Product(id: 1, title: "Test Product", price: 10.0, selectedQuantity: 1)
        viewModel.allproducts = [product]
        viewModel.addProduct(withID: 1)
        XCTAssertEqual(viewModel.selectedProducts.first?.id, product.id)
    }
    
    //MARK: - testAddProduct_product
    func testAddProduct_product() {
        let product = Product(id: 1, title: "Test Product", price: 10.0, selectedQuantity: 1)
        viewModel.addProduct(product: product)
        XCTAssertEqual(viewModel.selectedProducts.first?.id, product.id)
    }
    
    //MARK: - testAddRandomProduct
    func testAddRandomProduct() {
        let product = Product(id: 1, title: "Test Product", price: 10.0, selectedQuantity: 1)
        viewModel.allproducts = [product]
        viewModel.addRandomProduct()
        XCTAssertTrue(viewModel.selectedProducts.contains(where: { $0.id == product.id }))
    }
    
    //MARK: - testRemoveProduct_withID
    func testRemoveProduct_withID() {
        let product = Product(id: 1, title: "Test Product", price: 10.0, selectedQuantity: 1)
        viewModel.selectedProducts = [product]
        viewModel.removeProduct(withID: 1)
        XCTAssertEqual(viewModel.selectedProducts.count, 0)
    }
    
    //MARK: - testClearCart
    func testClearCart() {
        let product = Product(id: 1, title: "Test Product", price: 10.0, selectedQuantity: 1)
        viewModel.selectedProducts = [product]
        viewModel.clearCart()
        XCTAssertEqual(viewModel.selectedProducts.count, 0)
    }
    
    //MARK: - testSelectedItemsQuantity
    func testSelectedItemsQuantity() {
        let product1 = Product(id: 1, title: "Product 1", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", price: 15.0, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product 3", price: 20.0, selectedQuantity: 3)
        
        viewModel.selectedProducts = [product1, product2, product3]
        
        let expectedQuantity = product1.selectedQuantity! + product2.selectedQuantity! + product3.selectedQuantity!
        
        XCTAssertEqual(viewModel.selectedItemsQuantity, expectedQuantity)
    }
    
    //MARK: - testTotalPrice
    func testTotalPrice() {
        let product1 = Product(id: 1, title: "Product 1", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", price: 15.0, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product 3", price: 20.0, selectedQuantity: 3)
        
        viewModel.selectedProducts = [product1, product2, product3]
        
        let expectedPrice = (product1.price! * Double(product1.selectedQuantity!)) + (product2.price! * Double(product2.selectedQuantity!)) + (product3.price! * Double(product3.selectedQuantity!))
        
        XCTAssertEqual(viewModel.totalPrice, expectedPrice)
    }
    
}

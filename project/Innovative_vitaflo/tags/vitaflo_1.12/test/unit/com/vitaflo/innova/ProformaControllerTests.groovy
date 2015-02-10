package com.vitaflo.innova

import grails.test.*

class ProformaControllerTests extends ControllerUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAddDetail(){

        mockDomain(Product.class, [new Product(id:10, name:"new product")])

        mockParams.proformaDetail.product.id = 10
        mockParams.proformaDetail.quantity = 10
        mockParams.proformaDetail.dailyDose = 1

        controller.addDetail()

        assertEquals 1, renderArgs.model.proformaDetailList.size()
    }

}

import grails.test.*

class NumToWordsTagLibTests extends TagLibUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testNumToWords() {
        tagLib.numtoWords(number:'30.85', lang:'es')
        println tagLib.out.toString()
        assertEquals 'treinta con ochenta y cinco', tagLib.out.toString()
    }

    void testEnglishNumToWords() {
        tagLib.numtoWords(number:'30.85', lang:'en')
        println tagLib.out.toString()
        assertEquals 'thirty dollars eighty-five cents', tagLib.out.toString()
    }
}

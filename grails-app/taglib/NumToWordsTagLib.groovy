import com.mindprod.inwords.*
class NumToWordsTagLib {
    
    def numToWords ={attrs ->
        long dollars = Math.floor(attrs.number?.toDouble())
        long cents = Math.floor((attrs.number?.toDouble() - dollars) * 100d )
        
        StringBuilder wordAmount = new StringBuilder()
        if(attrs.lang =='en') {
            def americanEnglish = new AmericanEnglish()
            wordAmount.append(americanEnglish.toWords(dollars)).append(' dollars ')
            wordAmount.append(americanEnglish.toWords(cents)).append(' cents')
        } else if( attrs.lang == 'es') {
            def spanishForCheques = new SpanishForCheques()
            wordAmount.append(spanishForCheques.toWords(dollars))
            wordAmount.append(' con ').append(spanishForCheques.toWords(cents))
        }
        out << wordAmount.toString()
    }
}

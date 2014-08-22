package ve.gob.tsj.tags

/**
 * UtilesTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class TSJTagLib {
    static defaultEncodeAs = 'text'
    static namespace = "tsj"
   
    def sortAndForeach = {attrs,body ->
        if (attrs.sort == null) {
            throwTagError("Tag [sortAndForeach] is missing required attribute [sort] \"Sugerimos use g:each\"")
        } 
        if (attrs.in == null ) {
            throwTagError("Tag [sortAndForeach] is missing required attribute [in] ")
        } 
        attrs.in = attrs.in.sort{a,b->  
            def sort=0
            attrs.sort.each{
                if(sort==0)
                sort =  (a."${it}" <=> b."${it}")
            }
            sort
        }  
        
        attrs.in.eachWithIndex{ obj, i ->
            if(attrs.var)
                request.setAttribute(attrs.var, obj)
            else
                request.setAttribute("it", obj)
                
            if(attrs.index)
                request.setAttribute(attrs.index, i)
            else
                request.setAttribute("index", i)
            out<< body()
        }
    }
}

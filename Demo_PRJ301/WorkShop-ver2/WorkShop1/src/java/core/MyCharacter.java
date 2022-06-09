package core;

/**
 *
 * @author BachDuc
 */
public class MyCharacter {
    public int totalchracter(String text){
        if(text.isEmpty()){
            return 0;
        }
        String list[]=text.trim().split("");
        int count=0;
        for (String string : list) {
            count++;
        }
        return count;
    }
    public String chracteratindex(int index,String text){
        String list[]=text.split("");
        int count=0;
        for (String i : list) {
            if(count==index){
                return i;
            }
            count++;
        }
        return "";
    }
    public int stringratindex(String substring,String text){
            return text.indexOf(substring);
    }
    public String SubString(int from,int to,String text){
        String list[]=text.split("");
        int count=0;
        String substring="";
        for (String i : list) {
            if(count>=from&&count<=to){
                substring+=i;
            }
            count++;
        }
        return substring;
    }
    
}

public class MapTutorialOne {
    public void MapOne(){
	Map<Integer, String> objone=new Map<Integer, String>();
    Set<Id> setone = new Set<Id>();
    List<String> listone=new List<String>();
    objone.put(1,'A');
    objone.put(2, 'B');
    objone.put(3,'C');
    Map<Integer, String> objtwo=new Map<Integer, String>();
    objtwo=objone.clone();
    objtwo.clear();  // Empty
    objtwo=objone.clone();
    System.debug('objone.get(2)  :' + objone.get(2));
    
    }
}
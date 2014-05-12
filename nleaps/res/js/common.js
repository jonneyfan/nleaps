/**
* *
* @author fengshengde
* @created 
* @version 0.1
* 
*页面公用javascript方法
* 
*/
function openTab(id, title, url) {
    var node = {
        url:url,
        text: title,
        id: id,
        icon: null,
        refreshWhenExist:false
    };
    parent.addScriptTab.apply(parent, [node]);
}
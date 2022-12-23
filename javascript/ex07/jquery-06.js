// on()

function jQuery(selector) {
    let el =[];  // 생성한 태그나 찾은 태그를 담는 배열

    if(selector.startsWith('<')) {
        el[0] = document.createElement(selector.substring(1, selector.length - 1));
        console.log(el[0]);
        return el; // tbody
    } else {
        let nodeList = document.querySelectorAll(selector);
        for(let e of nodeList) {
            el.push(e);
        }
    }
    
    el.append = function(childBox) {
        // 자식 태그를 복제해서 각 부모 태그에 붙인다. 
        for(let parent of el) {
            // 자식들이 들어있는 상자에서 자식을 한 개씩 꺼내 복제하여 각 부모에 자식으로 붙인다.
            for(let child of childBox) {
                parent.appendChild(child.cloneNode(true));
            }
        }
        // 자식 태그는 제거한다. 
        for(let child of childBox) {
            if(child.appendElement != null || child.appendElement != undefined) {
            child.appendElement.removeChild(child);
            }
        }
    }
    el.html = function (content) {
        for(let e of el) {
            e.innerHTML = content;
        }
    }

    el.on = function(eventName, listener) {
        for (let e of el) {
            e.addEventListener(eventName, listener);
        }
    }
    return el;
}

var $ = jQuery;
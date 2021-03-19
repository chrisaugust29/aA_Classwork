const partyHeader = document.getElementById('party');


export const htmlGenerator = (string, htmlElement) => {

    if (htmlElement.children) {
        const arr = Array.from(htmlElement.children)
        arr.forEach(el => {
            htmlElement.removeChild(el);
        })
    }
    
    const p = document.createElement("p")
    p.innerText = string
    htmlElement.appendChild(p)   
};

htmlGenerator('Party Time.', partyHeader);
htmlGenerator('I <3 Vanilla DOM manipulation', partyHeader);


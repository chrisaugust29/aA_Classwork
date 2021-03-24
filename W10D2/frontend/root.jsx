import React from 'react';
import Clock from './clock';
import Tabs from './tabs';


const root = ()=> {

    const tabsArr = [{title: 'Title1', content: 'content1'},
    {title: 'Title2', content: 'content2'},
    {title: 'Title3', content: 'content3'}]
    return(
        <div>
            <Clock />
            <Tabs tabs={tabsArr} />
        </div>
    );


}


export default root;
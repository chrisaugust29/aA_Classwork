import React from 'react';

class Tabs extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            selectedTab: 0
        
        }
        this.selectTab1 = this.selectTab1.bind(this);
        this.selectTab2 = this.selectTab2.bind(this);
        this.selectTab3 = this.selectTab3.bind(this);
    
    }

    selectTab1(e){
        this.setState({selectedTab: 0});
    }

    selectTab2(e){
        this.setState({selectedTab: 1});
    }

    selectTab3(e){
        this.setState({selectedTab: 2});
    }

    render(){
        return (
            <div className="tab-container">
                <h1>Tabs</h1>
                <ul className="tab-header">
                    <li nameClass="header1" onClick={this.selectTab1}>{this.props.tabs[0].title}</li>
                    <li nameClass="header2" onClick={this.selectTab2}>{this.props.tabs[1].title}</li>
                    <li nameClass="header3" onClick={this.selectTab3}>{this.props.tabs[2].title}</li>
                </ul>
                <article className="tab-content">
                    {this.props.tabs[this.state.selectedTab].content}
                </article>

            </div>
        )
    }






}



export default Tabs;
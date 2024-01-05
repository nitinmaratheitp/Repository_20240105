import { LightningElement } from 'lwc';

export default class RenderingListForEach extends LightningElement {

    contacts = [
        {
            Id: 1,
            Name : 'Nitin Marathe',
            Title : 'Accenture'
        },
        {
            Id: 2,
            Name : 'Suhas nikam',
            Title : 'TCS'
        },
        {
            Id: 3,
            Name : 'Shubham Sagave',
            Title : 'Vodaphone'
        }
    ];
}
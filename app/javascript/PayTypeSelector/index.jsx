import React, { useState } from 'react'
import NoPayType from './NoPayType'
import CreditCardPayType from './CreditCardPayType'
import CheckPayType from './CheckPayType'
import PurchaseOrderPayType from './PurchaseOrderPayType'

const getCustomComponent = (payType) => {
    console.log(payType)
    switch (payType) {
        case "Credit card":
            return CreditCardPayType
        case "Check":
            return CheckPayType
        case "Purchase order":
            return PurchaseOrderPayType
        default:
            return NoPayType
    }
}

const PayTypeSelector = () => {
    const [selected, setSelected] = useState('')

    const onPayTypeSelected = (event) => (setSelected(event.target.value))
    
    const PayTypeCustomComponent = getCustomComponent(selected)

    return (
        <div>
            <div className="field">
                <label htmlFor="order_pay_type">Pay type</label>
                <select id="order_pay_type" name="order[pay_type]" onChange={onPayTypeSelected}>
                    <option value="">Select a payment method</option>
                    <option value="Check">Check</option>
                    <option value="Credit card">Credit card</option>
                    <option value="Purchase order">Purchase order</option>
                </select>
            </div>
            <PayTypeCustomComponent />
        </div>
    )
};

export default PayTypeSelector
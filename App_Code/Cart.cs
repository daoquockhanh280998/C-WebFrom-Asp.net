using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Cart
{
    public string Email { get; set; }
    public string FullName { get; set; }
    public string Password { get; set; }
    public int Mobi { get; set; }
    public int Mobi2 { get; set; }
    public bool Gender { get; set; }
    public string Address { get; set; }
    public int PaymentMethod { get; set; }



    public Dictionary<int, CartItem> CartItems { get; set; }

    public int Count // biến đếm từ sản phẩm để đổ vào Mini Cart
    {
        get
        {
            int count = 0;
            foreach (var item in CartItems.Values)
            {
                count += item.Quantity;
            }
            return count;
        }
    }

    public double Total
    {
        get
        {
            double total = 0;
            foreach (var item in CartItems.Values)
            {
                total += item.Quantity * item.OldPrice;
            }
            return total;
        }
    }

    public double Amount
    {
        get
        {
            double amount = 0;
            foreach (var item in CartItems.Values)
            {
                amount += item.Quantity * item.Price;
            }
            return amount;
        }
    }
    public double Bonus
    {
        get
        {
            return Total - Amount;
        }
    }
    public double Ship
    {
        get
        {
            double ship = 0;
            double ship1 = 5000;
            double ship2 = 200000;
            double ship3 = 300000;
            if (Amount > ship3)
            {
                return ship += 0;
            }
            else if (Amount >= ship2 && Amount < ship3)
            {
                return ship += 23000;
            }
            else if (Amount > ship1 && Amount < ship2)
            {
                return ship += 15000;
            }
            else
            {
                return ship += 0;
            }
        }
    }

    public double AmountPay
    {
        get
        {
            return Amount + Ship;
        }
    }
}
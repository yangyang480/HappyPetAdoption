package capstone.HappyPetAdoption.Extensions;

import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;

public class OrderStatusExtension {

    public static String OrderStatusString(OrderStatusEnum orderStatus) {
        switch (orderStatus) {
            case REQUESTED:
                return "Requested";
            case PENDING:
                return "Pending";
            case CANCELED:
                return "Canceled";
            case COMPLETED:
                return "Completed";
        }
        return "";
    }
}

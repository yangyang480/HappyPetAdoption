<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:include page="../../../WEB-INF/jsp/include/header.jsp" />

<link rel="stylesheet" href="../../../pub/style/profile.css">

<div class="container-lg my-2 my-lg-4">
    <h1>User Profile (Registered As)</h1>

    <form>
        <fieldset class="mt-2 mt-lg-4">
            <div class="mb-3 row">
                <label for="email" class="col-sm-2 col-form-label text-end">Email</label>
                <div class="col-sm-10">
                    <input type="text" id="email" class="form-control" name="email" value="${formbean.email}">
                </div>
                <div id="emptyEmail" class="invalid-feedback">
                    Please enter an email
                </div>
                <div id="emailNoAnnotation" class="invalid-feedback">
                    Email should have @.
                </div>
            </div>

            <div class="mb-3 row">
                <label for="name" class="col-sm-2 col-form-label text-end">Full Name</label>
                <div class="col-sm-10">
                    <input id="name" class="form-control" name="name" type="text" value="${formbean.name}">
                </div>
                <div id="emptyName" class="invalid-feedback">
                    Please enter your name
                </div>
            </div>

            <div class="mb-3 row">
                <label for="address" class="col-sm-2 col-form-label text-end">Address</label>
                <div class="col-sm-10">
                    <input id="address" class="form-control" name="address" type="text" value="${formbean.address}">
                </div>
                <div id="emptyAddress" class="invalid-feedback">
                    Please enter an address
                </div>
            </div>

            <div class="mb-3 row">
                <label for="city" class="col-sm-2 col-form-label text-end">City</label>
                <div class="col-sm-10">
                    <input id="city" class="form-control" name="city" type="text" value="${formbean.city}">
                </div>
                <div id="emptyCity" class="invalid-feedback">
                    Please enter a city
                </div>
            </div>

            <div class="mb-3 row">
                <label for="state" class="col-sm-2 col-form-label text-end">State</label>
                <div class="col-sm-10">
                    <select name="state" class="form-control" id="state" value="${formbean.state}">
                        <option value="-1">--State--</option><option value="AL">Alabama</option><option value="AK">Alaska</option><option value="AZ">Arizona</option><option value="AR">Arkansas</option><option value="CA">California</option><option value="CO">Colorado</option><option value="CT">Connecticut</option><option value="DE">Delaware</option><option value="DC">District Of Columbia</option><option value="FL">Florida</option><option value="GA">Georgia</option><option value="HI">Hawaii</option><option value="ID">Idaho</option><option value="IL">Illinois</option><option value="IN">Indiana</option><option value="IA">Iowa</option><option value="KS">Kansas</option><option value="KY">Kentucky</option><option value="LA">Louisiana</option><option value="ME">Maine</option><option value="MD">Maryland</option><option value="MA">Massachusetts</option><option value="MI">Michigan</option><option value="MN">Minnesota</option><option value="MS">Mississippi</option><option value="MO">Missouri</option><option value="MT">Montana</option><option value="NE">Nebraska</option><option value="NV">Nevada</option><option value="NH">New Hampshire</option><option value="NJ">New Jersey</option><option value="NM">New Mexico</option><option value="NY">New York</option><option value="NC">North Carolina</option><option value="ND">North Dakota</option><option value="OH">Ohio</option><option value="OK">Oklahoma</option><option value="OR">Oregon</option><option value="PA">Pennsylvania</option><option value="RI">Rhode Island</option><option value="SC">South Carolina</option><option value="SD">South Dakota</option><option value="TN">Tennessee</option><option value="TX">Texas</option><option value="UT">Utah</option><option value="VT">Vermont</option><option value="VA">Virginia</option><option value="WA">Washington</option><option value="WV">West Virginia</option><option value="WI">Wisconsin</option><option value="WY">Wyoming</option>
                    </select>
                </div>
                <div id="emptySelectState" class="invalid-feedback">
                    Please select a state
                </div>
            </div>

            <div class="mb-3 row">
                <label for="zipcode" class="col-sm-2 col-form-label text-end">Zipcode</label>
                <div class="col-sm-10">
                    <input id="zipcode" class="form-control" name="zipcode" type="text" value="${formbean.zipcode}">
                </div>
                <div id="emptyZipcode" class="invalid-feedback">
                    Please enter a zipcode
                </div>
                <div id="zipNot5Digits" class="invalid-feedback">
                    Zipcode should be 5 digits
                </div>
            </div>

            <div class="mb-3 row">
                <label for="phone" class="col-sm-2 col-form-label text-end">Phone Number</label>
                <div class="col-sm-10">
                    <input id="phone" class="form-control" name="phone" type="tel" value="${formBean.phone}">
                </div>
                <div id="emptyPhone" class="invalid-feedback">
                    Please enter a phone number
                </div>
                <div id="phoneNot10Digits" class="invalid-feedback">
                    Phone should be 10 digits
                </div>
            </div>
        </fieldset>

        <div class="mb-3 row">
            <div class="col-sm-2"></div>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary py-3 px-5">Submit</button>
            </div>
        </div>


    </form>
</div>

<jsp:include page="../../../WEB-INF/jsp/include/footer.jsp" />
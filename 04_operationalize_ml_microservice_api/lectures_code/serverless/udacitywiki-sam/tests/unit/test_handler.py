import json

import pytest

from udacitywiki import app


@pytest.fixture()
def apigw_event():
    """ Generates API GW Event"""

    return {
        "body": '{ "entity": "google"}'
    }


def test_lambda_handler(apigw_event, mocker):

    ret = app.lambda_handler(apigw_event, "")
    data = json.loads(ret["body"])

    assert ret["statusCode"] == "200"

    assert "message" in ret["body"]

    response_message = (
        "Google LLC is an American multinational technology company that specializes "
        + "in Internet-related services and products, which include online advertising "
        + "technologies, a search engine, cloud computing, software, and hardware.")
    assert data["message"] == response_message

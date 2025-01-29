class SubscriptionPackagesModel {
	String? message;
	List<SubscriptionPackagesData>? data;

	SubscriptionPackagesModel({this.message, this.data});

	SubscriptionPackagesModel.fromJson(Map<String, dynamic> json) {
		message = json['message'];
		if (json['data'] != null) {
			data = <SubscriptionPackagesData>[];
			json['data'].forEach((v) { data!.add(new SubscriptionPackagesData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['message'] = this.message;
		if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class SubscriptionPackagesData {
	Product? product;
	List<Plans>? plans;

	SubscriptionPackagesData({this.product, this.plans});

	SubscriptionPackagesData.fromJson(Map<String, dynamic> json) {
		product = json['product'] != null ? new Product.fromJson(json['product']) : null;
		if (json['plans'] != null) {
			plans = <Plans>[];
			json['plans'].forEach((v) { plans!.add(new Plans.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
		if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Product {
  String? id;
  String? object;
  bool? active;
  List<dynamic>? attributes;
  int? created;
  String? defaultPrice;
  String? description;
  List<dynamic>? features;
  List<String>? images; // Changed to List<String> since URLs are strings
  bool? livemode;
  List<dynamic>? marketingFeatures;
  Metadata? metadata;
  String? name;
  dynamic packageDimensions;
  bool? shippable; // Changed from dynamic to bool?
  String? statementDescriptor;
  String? taxCode;
  String? type;
  String? unitLabel;
  int? updated;
  String? url;

  Product({
    this.id,
    this.object,
    this.active,
    this.attributes,
    this.created,
    this.defaultPrice,
    this.description,
    this.features,
    this.images,
    this.livemode,
    this.marketingFeatures,
    this.metadata,
    this.name,
    this.packageDimensions,
    this.shippable,
    this.statementDescriptor,
    this.taxCode,
    this.type,
    this.unitLabel,
    this.updated,
    this.url,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    attributes = json['attributes'] ?? [];
    created = json['created'];
    defaultPrice = json['default_price'];
    description = json['description'];
    features = json['features'] ?? [];
    images = json['images'] != null ? List<String>.from(json['images']) : []; // Ensure list of Strings
    livemode = json['livemode'];
    marketingFeatures = json['marketing_features'] ?? [];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    name = json['name'];
    packageDimensions = json['package_dimensions'];
    shippable = json['shippable'] as bool?;
    statementDescriptor = json['statement_descriptor'];
    taxCode = json['tax_code'];
    type = json['type'];
    unitLabel = json['unit_label'];
    updated = json['updated'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['object'] = object;
    data['active'] = active;
    data['attributes'] = attributes;
    data['created'] = created;
    data['default_price'] = defaultPrice;
    data['description'] = description;
    data['features'] = features;
    data['images'] = images;
    data['livemode'] = livemode;
    data['marketing_features'] = marketingFeatures;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['name'] = name;
    data['package_dimensions'] = packageDimensions;
    data['shippable'] = shippable;
    data['statement_descriptor'] = statementDescriptor;
    data['tax_code'] = taxCode;
    data['type'] = type;
    data['unit_label'] = unitLabel;
    data['updated'] = updated;
    data['url'] = url;
    return data;
  }
}
class Metadata {
	String? admins;
	String? companies;
	String? employees;
	String? projects;
	String? reminders;
	String? tasks;
	String? workers;

	Metadata({this.admins, this.companies, this.employees, this.projects, this.reminders, this.tasks, this.workers});

	Metadata.fromJson(Map<String, dynamic> json) {
		admins = json['admins'];
		companies = json['companies'];
		employees = json['employees'];
		projects = json['projects'];
		reminders = json['reminders'];
		tasks = json['tasks'];
		workers = json['workers'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['admins'] = this.admins;
		data['companies'] = this.companies;
		data['employees'] = this.employees;
		data['projects'] = this.projects;
		data['reminders'] = this.reminders;
		data['tasks'] = this.tasks;
		data['workers'] = this.workers;
		return data;
	}
}

class Plans {
	String? id;
	String? object;
	bool? active;
	String? billingScheme;
	int? created;
	String? currency;
	Null customUnitAmount;
	bool? livemode;
	Null lookupKey;
	Metadata? metadata;
	Null nickname;
	String? product;
	Recurring? recurring;
	String? taxBehavior;
	Null tiersMode;
	Null transformQuantity;
	String? type;
	int? unitAmount;
	String? unitAmountDecimal;

	Plans({this.id, this.object, this.active, this.billingScheme, this.created, this.currency, this.customUnitAmount, this.livemode, this.lookupKey, this.metadata, this.nickname, this.product, this.recurring, this.taxBehavior, this.tiersMode, this.transformQuantity, this.type, this.unitAmount, this.unitAmountDecimal});

	Plans.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		object = json['object'];
		active = json['active'];
		billingScheme = json['billing_scheme'];
		created = json['created'];
		currency = json['currency'];
		customUnitAmount = json['custom_unit_amount'];
		livemode = json['livemode'];
		lookupKey = json['lookup_key'];
		metadata = json['metadata'] != null ? new Metadata.fromJson(json['metadata']) : null;
		nickname = json['nickname'];
		product = json['product'];
		recurring = json['recurring'] != null ? new Recurring.fromJson(json['recurring']) : null;
		taxBehavior = json['tax_behavior'];
		tiersMode = json['tiers_mode'];
		transformQuantity = json['transform_quantity'];
		type = json['type'];
		unitAmount = json['unit_amount'];
		unitAmountDecimal = json['unit_amount_decimal'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['object'] = this.object;
		data['active'] = this.active;
		data['billing_scheme'] = this.billingScheme;
		data['created'] = this.created;
		data['currency'] = this.currency;
		data['custom_unit_amount'] = this.customUnitAmount;
		data['livemode'] = this.livemode;
		data['lookup_key'] = this.lookupKey;
		if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
		data['nickname'] = this.nickname;
		data['product'] = this.product;
		if (this.recurring != null) {
      data['recurring'] = this.recurring!.toJson();
    }
		data['tax_behavior'] = this.taxBehavior;
		data['tiers_mode'] = this.tiersMode;
		data['transform_quantity'] = this.transformQuantity;
		data['type'] = this.type;
		data['unit_amount'] = this.unitAmount;
		data['unit_amount_decimal'] = this.unitAmountDecimal;
		return data;
	}
}



class Recurring {
	Null aggregateUsage;
	String? interval;
	int? intervalCount;
	Null meter;
	Null trialPeriodDays;
	String? usageType;

	Recurring({this.aggregateUsage, this.interval, this.intervalCount, this.meter, this.trialPeriodDays, this.usageType});

	Recurring.fromJson(Map<String, dynamic> json) {
		aggregateUsage = json['aggregate_usage'];
		interval = json['interval'];
		intervalCount = json['interval_count'];
		meter = json['meter'];
		trialPeriodDays = json['trial_period_days'];
		usageType = json['usage_type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['aggregate_usage'] = this.aggregateUsage;
		data['interval'] = this.interval;
		data['interval_count'] = this.intervalCount;
		data['meter'] = this.meter;
		data['trial_period_days'] = this.trialPeriodDays;
		data['usage_type'] = this.usageType;
		return data;
	}
}
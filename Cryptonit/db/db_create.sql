CREATE TABLE [dbo].[Address] (
    [Id]          INT IDENTITY (1, 1) NOT NULL,
    [UserId]      INT NOT NULL,
    [CurrencyId]  INT NOT NULL,
    [PublicKeyId] INT NOT NULL,
    [SignatureId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([SignatureId]) REFERENCES [dbo].[Signature] ([Id]),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[Currency] ([Id]),
    FOREIGN KEY ([PublicKeyId]) REFERENCES [dbo].[PublicKey] ([Id]),
    FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[Currency] ([Id]),
    FOREIGN KEY ([PublicKeyId]) REFERENCES [dbo].[PublicKey] ([Id])
);
CREATE TABLE [dbo].[Currency] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [Abbreviation] VARCHAR (5)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
CREATE TABLE [dbo].[PublicKey] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [HashCode] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Recipient] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (255) NOT NULL,
    [CurrencyId]  INT           NOT NULL,
    [PublicKeyId] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[Currency] ([Id]),
    FOREIGN KEY ([PublicKeyId]) REFERENCES [dbo].[PublicKey] ([Id])
);

CREATE TABLE [dbo].[Signature] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [HashCode] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Transaction] (
    [Id]                  INT  IDENTITY (1, 1) NOT NULL,
    [UserId]              INT  NOT NULL,
    [AddressId]           INT  NOT NULL,
    [Date]                DATE NOT NULL,
    [TransactionStatusId] INT  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    FOREIGN KEY ([TransactionStatusId]) REFERENCES [dbo].[TransactionStatus] ([Id])
);
CREATE TABLE [dbo].[TransactionStatus] (
    [Id]     INT          IDENTITY (1, 1) NOT NULL,
    [Status] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
CREATE TABLE [dbo].[UserContact] (
    [Id]             INT           NOT NULL,
    [ContactAddress] VARCHAR (255) NOT NULL,
    [CurrencyId]     INT           NOT NULL,
    [ContactName]    VARCHAR (50)  NOT NULL,
    [UserId]         INT           NOT NULL,
    [PublicKeyId]    INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([PublicKeyId]) REFERENCES [dbo].[PublicKey] ([Id]),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[Currency] ([Id])
);

CREATE TABLE [dbo].[UserCurrency] (
    [UserId]     INT NOT NULL,
    [CurrencyId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC, [CurrencyId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[Currency] ([Id])
);
CREATE TABLE [dbo].[Users] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [name]     VARCHAR (50)   NOT NULL,
    [surname]  VARCHAR (50)   NOT NULL,
    [login]    VARCHAR (50)   NOT NULL,
    [password] NVARCHAR (MAX) NOT NULL,
    [email]    VARCHAR (50)   NOT NULL,
    [salt]     VARCHAR (25)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);





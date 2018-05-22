
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/22/2018 12:20:54
-- Generated from EDMX file: C:\Users\Ярослав\Desktop\CRYPTONIT_MORENEWEST\Cryptonit\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Cryptonit];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Address__Currenc__51300E55]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__Currenc__51300E55];
GO
IF OBJECT_ID(N'[dbo].[FK__Address__Currenc__531856C7]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__Currenc__531856C7];
GO
IF OBJECT_ID(N'[dbo].[FK__Address__PublicK__5224328E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__PublicK__5224328E];
GO
IF OBJECT_ID(N'[dbo].[FK__Address__PublicK__540C7B00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__PublicK__540C7B00];
GO
IF OBJECT_ID(N'[dbo].[FK__Address__Signatu__4F47C5E3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__Signatu__4F47C5E3];
GO
IF OBJECT_ID(N'[dbo].[FK__Address__UserId__503BEA1C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__UserId__503BEA1C];
GO
IF OBJECT_ID(N'[dbo].[FK__Recipient__Curre__74AE54BC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Recipient] DROP CONSTRAINT [FK__Recipient__Curre__74AE54BC];
GO
IF OBJECT_ID(N'[dbo].[FK__Recipient__Publi__75A278F5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Recipient] DROP CONSTRAINT [FK__Recipient__Publi__75A278F5];
GO
IF OBJECT_ID(N'[dbo].[FK__Transacti__Trans__03F0984C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK__Transacti__Trans__03F0984C];
GO
IF OBJECT_ID(N'[dbo].[FK__Transacti__UserI__02084FDA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK__Transacti__UserI__02084FDA];
GO
IF OBJECT_ID(N'[dbo].[FK__UserConta__Curre__3C34F16F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserContact] DROP CONSTRAINT [FK__UserConta__Curre__3C34F16F];
GO
IF OBJECT_ID(N'[dbo].[FK__UserConta__UserI__3B40CD36]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserContact] DROP CONSTRAINT [FK__UserConta__UserI__3B40CD36];
GO
IF OBJECT_ID(N'[dbo].[FK__UserCurre__Curre__05D8E0BE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCurrency] DROP CONSTRAINT [FK__UserCurre__Curre__05D8E0BE];
GO
IF OBJECT_ID(N'[dbo].[FK__UserCurre__UserI__04E4BC85]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCurrency] DROP CONSTRAINT [FK__UserCurre__UserI__04E4BC85];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Address]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Address];
GO
IF OBJECT_ID(N'[dbo].[Currency]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Currency];
GO
IF OBJECT_ID(N'[dbo].[PublicKey]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PublicKey];
GO
IF OBJECT_ID(N'[dbo].[Recipient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Recipient];
GO
IF OBJECT_ID(N'[dbo].[Signature]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Signature];
GO
IF OBJECT_ID(N'[dbo].[Transaction]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transaction];
GO
IF OBJECT_ID(N'[dbo].[TransactionStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionStatus];
GO
IF OBJECT_ID(N'[dbo].[UserContact]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserContact];
GO
IF OBJECT_ID(N'[dbo].[UserCurrency]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserCurrency];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Address'
CREATE TABLE [dbo].[Address] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Address1] varchar(255)  NOT NULL,
    [CurrencyId] int  NOT NULL,
    [PublicKeyId] int  NOT NULL,
    [SignatureId] int  NOT NULL
);
GO

-- Creating table 'Currency'
CREATE TABLE [dbo].[Currency] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Abbreviation] varchar(5)  NOT NULL
);
GO

-- Creating table 'PublicKey'
CREATE TABLE [dbo].[PublicKey] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HashCode] varchar(255)  NOT NULL
);
GO

-- Creating table 'Recipient'
CREATE TABLE [dbo].[Recipient] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NOT NULL,
    [CurrencyId] int  NOT NULL,
    [PublicKeyId] int  NOT NULL
);
GO

-- Creating table 'Signature'
CREATE TABLE [dbo].[Signature] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HashCode] varchar(255)  NOT NULL
);
GO

-- Creating table 'Transaction'
CREATE TABLE [dbo].[Transaction] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [AddressId] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [TransactionStatusId] int  NOT NULL
);
GO

-- Creating table 'TransactionStatus'
CREATE TABLE [dbo].[TransactionStatus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] varchar(50)  NOT NULL
);
GO

-- Creating table 'UserContact'
CREATE TABLE [dbo].[UserContact] (
    [Id] int  NOT NULL,
    [ContactAddress] varchar(255)  NOT NULL,
    [CurrencyId] int  NOT NULL,
    [ContactName] varchar(50)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NOT NULL,
    [surname] varchar(50)  NOT NULL,
    [login] varchar(50)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [email] varchar(50)  NOT NULL,
    [salt] varchar(25)  NULL
);
GO

-- Creating table 'UserCurrency'
CREATE TABLE [dbo].[UserCurrency] (
    [Currency_Id] int  NOT NULL,
    [Users_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [PK_Address]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Currency'
ALTER TABLE [dbo].[Currency]
ADD CONSTRAINT [PK_Currency]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PublicKey'
ALTER TABLE [dbo].[PublicKey]
ADD CONSTRAINT [PK_PublicKey]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Recipient'
ALTER TABLE [dbo].[Recipient]
ADD CONSTRAINT [PK_Recipient]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Signature'
ALTER TABLE [dbo].[Signature]
ADD CONSTRAINT [PK_Signature]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [PK_Transaction]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TransactionStatus'
ALTER TABLE [dbo].[TransactionStatus]
ADD CONSTRAINT [PK_TransactionStatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserContact'
ALTER TABLE [dbo].[UserContact]
ADD CONSTRAINT [PK_UserContact]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Currency_Id], [Users_Id] in table 'UserCurrency'
ALTER TABLE [dbo].[UserCurrency]
ADD CONSTRAINT [PK_UserCurrency]
    PRIMARY KEY CLUSTERED ([Currency_Id], [Users_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CurrencyId] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [FK__Address__Currenc__51300E55]
    FOREIGN KEY ([CurrencyId])
    REFERENCES [dbo].[Currency]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Address__Currenc__51300E55'
CREATE INDEX [IX_FK__Address__Currenc__51300E55]
ON [dbo].[Address]
    ([CurrencyId]);
GO

-- Creating foreign key on [CurrencyId] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [FK__Address__Currenc__531856C7]
    FOREIGN KEY ([CurrencyId])
    REFERENCES [dbo].[Currency]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Address__Currenc__531856C7'
CREATE INDEX [IX_FK__Address__Currenc__531856C7]
ON [dbo].[Address]
    ([CurrencyId]);
GO

-- Creating foreign key on [PublicKeyId] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [FK__Address__PublicK__5224328E]
    FOREIGN KEY ([PublicKeyId])
    REFERENCES [dbo].[PublicKey]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Address__PublicK__5224328E'
CREATE INDEX [IX_FK__Address__PublicK__5224328E]
ON [dbo].[Address]
    ([PublicKeyId]);
GO

-- Creating foreign key on [PublicKeyId] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [FK__Address__PublicK__540C7B00]
    FOREIGN KEY ([PublicKeyId])
    REFERENCES [dbo].[PublicKey]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Address__PublicK__540C7B00'
CREATE INDEX [IX_FK__Address__PublicK__540C7B00]
ON [dbo].[Address]
    ([PublicKeyId]);
GO

-- Creating foreign key on [SignatureId] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [FK__Address__Signatu__4F47C5E3]
    FOREIGN KEY ([SignatureId])
    REFERENCES [dbo].[Signature]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Address__Signatu__4F47C5E3'
CREATE INDEX [IX_FK__Address__Signatu__4F47C5E3]
ON [dbo].[Address]
    ([SignatureId]);
GO

-- Creating foreign key on [UserId] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [FK__Address__UserId__503BEA1C]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Address__UserId__503BEA1C'
CREATE INDEX [IX_FK__Address__UserId__503BEA1C]
ON [dbo].[Address]
    ([UserId]);
GO

-- Creating foreign key on [CurrencyId] in table 'Recipient'
ALTER TABLE [dbo].[Recipient]
ADD CONSTRAINT [FK__Recipient__Curre__74AE54BC]
    FOREIGN KEY ([CurrencyId])
    REFERENCES [dbo].[Currency]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Recipient__Curre__74AE54BC'
CREATE INDEX [IX_FK__Recipient__Curre__74AE54BC]
ON [dbo].[Recipient]
    ([CurrencyId]);
GO

-- Creating foreign key on [CurrencyId] in table 'UserContact'
ALTER TABLE [dbo].[UserContact]
ADD CONSTRAINT [FK__UserConta__Curre__3C34F16F]
    FOREIGN KEY ([CurrencyId])
    REFERENCES [dbo].[Currency]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__UserConta__Curre__3C34F16F'
CREATE INDEX [IX_FK__UserConta__Curre__3C34F16F]
ON [dbo].[UserContact]
    ([CurrencyId]);
GO

-- Creating foreign key on [PublicKeyId] in table 'Recipient'
ALTER TABLE [dbo].[Recipient]
ADD CONSTRAINT [FK__Recipient__Publi__75A278F5]
    FOREIGN KEY ([PublicKeyId])
    REFERENCES [dbo].[PublicKey]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Recipient__Publi__75A278F5'
CREATE INDEX [IX_FK__Recipient__Publi__75A278F5]
ON [dbo].[Recipient]
    ([PublicKeyId]);
GO

-- Creating foreign key on [TransactionStatusId] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [FK__Transacti__Trans__03F0984C]
    FOREIGN KEY ([TransactionStatusId])
    REFERENCES [dbo].[TransactionStatus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Transacti__Trans__03F0984C'
CREATE INDEX [IX_FK__Transacti__Trans__03F0984C]
ON [dbo].[Transaction]
    ([TransactionStatusId]);
GO

-- Creating foreign key on [UserId] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [FK__Transacti__UserI__02084FDA]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Transacti__UserI__02084FDA'
CREATE INDEX [IX_FK__Transacti__UserI__02084FDA]
ON [dbo].[Transaction]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'UserContact'
ALTER TABLE [dbo].[UserContact]
ADD CONSTRAINT [FK__UserConta__UserI__3B40CD36]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__UserConta__UserI__3B40CD36'
CREATE INDEX [IX_FK__UserConta__UserI__3B40CD36]
ON [dbo].[UserContact]
    ([UserId]);
GO

-- Creating foreign key on [Currency_Id] in table 'UserCurrency'
ALTER TABLE [dbo].[UserCurrency]
ADD CONSTRAINT [FK_UserCurrency_Currency]
    FOREIGN KEY ([Currency_Id])
    REFERENCES [dbo].[Currency]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_Id] in table 'UserCurrency'
ALTER TABLE [dbo].[UserCurrency]
ADD CONSTRAINT [FK_UserCurrency_Users]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCurrency_Users'
CREATE INDEX [IX_FK_UserCurrency_Users]
ON [dbo].[UserCurrency]
    ([Users_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
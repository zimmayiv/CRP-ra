"""does it still work w/ the models.py?

Revision ID: d4f84843a8b7
Revises: 866ea1e54164
Create Date: 2024-09-26 11:35:13.908160

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'd4f84843a8b7'
down_revision = '866ea1e54164'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('shooting', schema=None) as batch_op:
        batch_op.alter_column('lat',
               existing_type=sa.REAL(),
               type_=sa.Float(precision=8),
               existing_nullable=True)
        batch_op.alter_column('lng',
               existing_type=sa.REAL(),
               type_=sa.Float(precision=8),
               existing_nullable=True)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('shooting', schema=None) as batch_op:
        batch_op.alter_column('lng',
               existing_type=sa.Float(precision=8),
               type_=sa.REAL(),
               existing_nullable=True)
        batch_op.alter_column('lat',
               existing_type=sa.Float(precision=8),
               type_=sa.REAL(),
               existing_nullable=True)

    # ### end Alembic commands ###

-- AUTO-GENERATED: OP09-047 / 코즈키 오뎅
-- rules_id=OP09-047 script_id=880001143 fingerprint=248a300caad8a972e6bdc192757bbe65c038862b3a2f288d7890ebefe940815a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[OP09-047]],
    schema_version=1,
  })
end

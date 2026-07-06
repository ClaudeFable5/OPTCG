-- AUTO-GENERATED: OP06-029 / 달마
-- rules_id=OP06-029 script_id=880000763 fingerprint=3b3425130c142aa79d75d547c3ec9ec91ef95ca6dfd0bd4b23522ed058c122b5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[신 어인 해적단]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【어택 시】【턴 1회】자신의 리더가 《신 어인 해적단》 특징을 가진 경우, 이 캐릭터를 액티브로 하고, 이번 턴 동안, 이 캐릭터의 파워 +1000. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-029]],
    schema_version=1,
  })
end

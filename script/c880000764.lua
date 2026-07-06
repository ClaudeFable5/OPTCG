-- AUTO-GENERATED: OP06-030 / 도슨
-- rules_id=OP06-030 script_id=880000764 fingerprint=333a9e6a563116011cef2bb7a0201255686b2da8ca4515072a36a2cbb506fbdd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=2000,
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 리더가 《신 어인 해적단》 특징을 가진 경우, 다음 자신의 턴 개시 시까지, 이 캐릭터는 배틀에서는 KO 당하지 않으며 파워 +2000. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-030]],
    schema_version=1,
  })
end

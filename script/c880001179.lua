-- AUTO-GENERATED: OP09-083 / 반 오거
-- rules_id=OP09-083 script_id=880001179 fingerprint=4920cb3162b3dad4b54815392bced26b0558d7d8594eedce439c732f4ddb1018
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[검은 수염 해적단]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 리더가 《검은 수염 해적단》 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -3.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-083]],
    schema_version=1,
  })
end

-- AUTO-GENERATED: ST27-001 / 아발로 피사로
-- rules_id=ST27-001 script_id=880001995 fingerprint=6dc3901c205ce80a3781f2eba68239d8e74d37b45566d2d49d8a727a8afe315c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST27-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
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
            count=1,
            filter={
              name=[[벌집]],
            },
            kinds={
              [[LEADER]],
              [[CHARACTER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 「벌집」 1장을 레스트할 수 있다: 자신의 리더가 《검은 수염 해적단》 특징을 가진 경우, 이번 턴 동안, 이 캐릭터의 파워 +4000.]],
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
    rules_id=[[ST27-001]],
    schema_version=1,
  })
end
